Attribute VB_Name = "模块1"
Option Explicit
Option Base 1

Sub Docx2Txt()
' @VERSION 1.0.0
' @AUTHOR  WisdomFusion
'
' 我的自白：
' 1. 我是启用宏的 Word 文档，请在初次打开我时启用宏
' 2. 我打开的是 docx，吐出的是 jpg 和 txt，txt 编码 UTF-8-BOM Unix(LF)
' 3. 让我处理文档前，先下载安装 ImageMagick，用于导出图片的格式转换：http://imagemagick.org/script/download.php#windows
' 4. 为避免文件混乱，请把我放在一个干干净净的文件夹中
' 5. 我不完美，需要反馈和 bugfix
'
' CHANGELOG:
' - 20180920 完善空答案和空选项的情况
'
    
    Dim strMainPath As String
    Dim strNewPath As String
    Dim objFileDialog As fileDialog
    Dim docToProcess As Document
    
    ' 宏文件所在文件夹，也是生成文件之所在
    strMainPath = ActiveDocument.Path
    
    ' 选择要处理的 docx 文件
    Set objFileDialog = Application.fileDialog(msoFileDialogFilePicker)
    objFileDialog.AllowMultiSelect = False
    objFileDialog.Filters.Clear
    objFileDialog.Filters.Add "Word files", "*.docx"
    
    If objFileDialog.Show = -1 Then
        Set docToProcess = Documents.Open(FileName:=objFileDialog.SelectedItems(1), AddToRecentFiles:=False)
    End If
    
    ' 如果没有选文件，那自然是退出，再见
    If docToProcess Is Nothing Then
        MsgBox "Woops! no doc is opened..."
        Exit Sub
    End If

    ' 另存一个新文件，原文件我不碰
    strNewPath = strMainPath & Application.PathSeparator & docToProcess.Name
    docToProcess.SaveAs2 FileName:=strNewPath
    
    ' =========================== START ==========================
    ' 以下处理，顺序很重要的！
    
    Application.ScreenUpdating = False
    
    ConvertSuperscriptToHtml docToProcess ' 上标
    ConvertSubscriptToHtml docToProcess   ' 下标
    
    ' 选项中项目编号转为文本
    ConvertListsInOptionsToText docToProcess
    ' 题号的项目编号转文本
    ConvertQuestionNoListsToText docToProcess
    
    ' 题干和答案中的列表转为 ol,ul 等 HTML 标签
    ' 目前只支持一级列表，嵌套列表后续完善
    ConvertListsInBodyToHtml docToProcess
    
    ' 基本样式全文置为基础样式
    PreprocessBasicFormat docToProcess
    
    ' 表格转为 HTML 标签
    ' 目前只支持普通表格和有横向单元格合并的表格
    ' 后续完善有纵向单元格合并的表格
    ConvertTablesToHtml docToProcess
    
    ' 导出文档中所有的图片
    SaveImagesToDiskFiles docToProcess
    ' emf 转 jpg，同时删除 emf 文件
    ConvertEmfToJpg docToProcess
    
    ProcessQuestionBody docToProcess   ' 处理题干
    ProcessQuestionOption docToProcess ' 处理选项
    ProcessAnswer docToProcess         ' 处理答案
    PrepareQuestionAttr docToProcess   ' 处理题目属性字段，把分类、题号、题型等题目字段转成待导入的格式
    
    ' 最后把关，处理遗留格式
    PostprocessDocumentFormat docToProcess

    docToProcess.Save

    Application.ScreenUpdating = True

    ' 另存为 txt
    SaveMeToTxt docToProcess
    
    MsgBox "Hah, DONE!"
End Sub

Private Sub PreprocessBasicFormat(docToProcess As Document)
' 预处理格式
    
    Debug.Print "PreprocessBasicFormat"

    With docToProcess.Content.Find
        .ClearFormatting
        .Execute FindText:="^l", ReplaceWith:="^p", Forward:=True, Format:=False, MatchWildcards:=False, Replace:=wdReplaceAll
        .Execute FindText:="^13{2,}", ReplaceWith:="^p", Forward:=True, Format:=False, MatchWildcards:=True, Replace:=wdReplaceAll
        .Execute FindText:="^13[  ^9]{1,}", ReplaceWith:="^p", Forward:=True, Format:=False, MatchWildcards:=True, Replace:=wdReplaceAll
        .Execute FindText:="[  ^9]{1,}^13", ReplaceWith:="^p", Forward:=True, Format:=False, MatchWildcards:=True, Replace:=wdReplaceAll
    End With
End Sub

Private Sub PostprocessDocumentFormat(docToProcess As Document)
' 最后处理一下遗留格式

    Debug.Print "PostprocessDocumentFormat"

    docToProcess.Range.Select
    
    If StyleExists("正文", docToProcess) = True Then
        Selection.Style = "正文"
    ElseIf StyleExists("Normal", docToProcess) = True Then
        Selection.Style = "Normal"
    End If
    
    With docToProcess.Content.Find
        .ClearFormatting
        .Execute FindText:="</p>^p<", ReplaceWith:="</p><", Forward:=True, Replace:=wdReplaceAll, MatchWildcards:=False
        .Execute FindText:="<p></p>", ReplaceWith:="", Forward:=True, Replace:=wdReplaceAll, MatchWildcards:=False
        .Execute FindText:="<p><table", ReplaceWith:="<table", Forward:=True, Replace:=wdReplaceAll, MatchWildcards:=False
        .Execute FindText:="</table></p>", ReplaceWith:="</table>", Forward:=True, Replace:=wdReplaceAll, MatchWildcards:=False
        .Execute FindText:="(=category#[!^13]{1,})^13=end", ReplaceWith:="\1", Forward:=True, MatchWildcards:=True
    End With
End Sub

Private Sub PrepareQuestionAttr(docToProcess As Document)
' 处理题目字段

    Debug.Print "PrepareQuestionAttr"
    
    With docToProcess.Content.Find
        .ClearFormatting
        .Execute FindText:="【分类】", ReplaceWith:="=category#", Forward:=True, Format:=False, MatchWildcards:=False, Replace:=wdReplaceAll
        .Execute FindText:="【题号】", ReplaceWith:="^p=no#", Forward:=True, Format:=False, MatchWildcards:=False, Replace:=wdReplaceAll
        .Execute FindText:="【题型】单选", ReplaceWith:="^p=type#single_choice", Forward:=True, Format:=False, MatchWildcards:=False, Replace:=wdReplaceAll
        .Execute FindText:="【题型】多选", ReplaceWith:="^p=type#multiple_choice", Forward:=True, Format:=False, MatchWildcards:=False, Replace:=wdReplaceAll
        .Execute FindText:="【题型】问答", ReplaceWith:="^p=type#subjective_question", Forward:=True, Format:=False, MatchWildcards:=False, Replace:=wdReplaceAll
        .Execute FindText:="【难度】★★★", ReplaceWith:="^p=level#3", Forward:=True, Format:=False, MatchWildcards:=False, Replace:=wdReplaceAll
        .Execute FindText:="【难度】★★", ReplaceWith:="^p=level#2", Forward:=True, Format:=False, MatchWildcards:=False, Replace:=wdReplaceAll
        .Execute FindText:="【难度】★", ReplaceWith:="^p=level#1", Forward:=True, Format:=False, MatchWildcards:=False, Replace:=wdReplaceAll
        .Execute FindText:="【特殊】△", ReplaceWith:="^p=special#T", Forward:=True, Format:=False, MatchWildcards:=False, Replace:=wdReplaceAll
        .Execute FindText:="【特殊】", ReplaceWith:="^p=special#", Forward:=True, Format:=False, MatchWildcards:=False, Replace:=wdReplaceAll
        .Execute FindText:="【答题格式】横线", ReplaceWith:="^p=format#grid", Forward:=True, Format:=False, MatchWildcards:=False, Replace:=wdReplaceAll
        .Execute FindText:="【答题格式】表格", ReplaceWith:="^p=format#table", Forward:=True, Format:=False, MatchWildcards:=False, Replace:=wdReplaceAll
        .Execute FindText:="^13{2,}", ReplaceWith:="^p", Forward:=True, Format:=False, MatchWildcards:=True, Replace:=wdReplaceAll
    End With
End Sub

Private Sub ConvertTablesToHtml(docToProcess As Document)
' 把表格转为 HTML 代码前的预处理
    
    Debug.Print "ConvertTablesToHtml"

    Dim oTable As Table
    Dim i As Integer
    
    ' 表格前后加空行
    For i = docToProcess.Tables.Count To 1 Step -1
        docToProcess.Tables(i).Range.Select
        With Selection
            .Cut
            .Text = vbCrLf & vbCrLf & vbCrLf
            .End = .End - 1
            .start = .start + 1
            .Paste
        End With
    Next
    
    IterateTables docToProcess
    
End Sub

Private Sub IterateTables(docToProcess As Document)
' 把表格转为 HTML

    Debug.Print "IterateTables"

    Dim i As Integer ' 表格索引
    Dim j As Integer ' 表格中的单元格索引
    Dim k As Integer ' 遍历结果行二维数组
    Dim l As Integer ' 遍历结果行二维数组
    
    Dim objTable As Table
    Dim objCell As Cell
    
    Dim intRowSpan As Integer
    Dim intColSpan As Integer
    
    Dim strTable As String  ' 某个表格最终的 HTML 代码
    Dim arrRows() As String ' 某个表格的行数组
    
    ' 遍历当前文档中所有的表格
    For i = docToProcess.Tables.Count To 1 Step -1
        Set objTable = docToProcess.Tables(i)
        strTable = "<table>"
        
        ' 重定义存放表格行内容的二维数组
        ReDim arrRows(objTable.Rows.Count, objTable.Columns.Count)
        
        ' 遍历表格中的单元格
        For j = 1 To objTable.Range.Cells.Count
            Set objCell = objTable.Range.Cells(j)
            objCell.Select
            intRowSpan = Selection.Information(wdEndOfRangeRowNumber) - Selection.Information(wdStartOfRangeRowNumber) + 1
            'Debug.Print "rowspan=" & intRowSpan
            intColSpan = Selection.Information(wdEndOfRangeColumnNumber) - Selection.Information(wdStartOfRangeColumnNumber) + 1
            'Debug.Print "colspan=" & intColSpan
            
            Dim strTd As String
            strTd = "<td"
            
            If intRowSpan > 1 Then
                strTd = strTd & " rowspan=""" & intRowSpan & """"
            End If
            
            If intColSpan > 1 Then
                strTd = strTd & " colspan=""" & intColSpan & """"
            End If
            
            strTd = strTd & ">"
            
            Dim strTdText As String
            strTdText = Replace(Replace(Selection.Text, Chr(7), ""), Chr(13), "<br />")
            strTdText = strTd & strTdText & "</td>"
            ' 把 Chr(7) 替换为 "" 后，好像变成 Chr(13) ？。。。
            strTdText = Replace(strTdText, "<br /></td>", "</td>")
            
            arrRows(objCell.RowIndex, objCell.ColumnIndex) = strTdText
        Next j ' objTable.Range.Cells
        
        ' 拼接结果
        Dim strTr As String
        For k = LBound(arrRows, 1) To UBound(arrRows, 1)
            strTr = "<tr>"
            
            For l = LBound(arrRows, 2) To UBound(arrRows, 2)
                strTr = strTr & arrRows(k, l)
            Next l
            
            strTr = strTr & "</tr>"
            strTable = strTable & strTr
        Next k
        
        strTable = strTable & "</table>"
        
        'Debug.Print strTable & vbCrLf
        
        ' 替换到文档中
        objTable.Select
        Selection.Cut
        Selection.InsertBefore strTable
        
    Next i ' ActiveDocument.Tables

End Sub

Private Sub ConvertListsInOptionsToText(docToProcess As Document)
' 选项中的项目编号转成文字
' 先把选项中的项目编号处理掉，再用 ConvertListsInQuestionBodyToHtml 处理题干中的项目编号

    Debug.Print "ConvertListsInOptionsToText"

    Dim oPara As Paragraph
    
    With docToProcess.Content.Find
        .ClearFormatting
        .Replacement.ClearFormatting
        .Execute FindText:="【选项】*【答案】", Forward:=True, Format:=False, MatchWildcards:=True
        
        Do While .Found = True
            For Each oPara In Selection.Range.listParagraphs
                oPara.Range.ListFormat.ConvertNumbersToText
            Next oPara
            
            .Execute
        Loop
    End With
End Sub

Private Sub ConvertQuestionNoListsToText(docToProcess As Document)
' 题号的项目编号转文本

    Debug.Print "ConvertQuestionNoListsToText"

    Dim oPara As Paragraph
    
    For Each oPara In docToProcess.listParagraphs
        If StartsWith(oPara.Range.ListFormat.ListString, "【题号】") = True Then
            oPara.Range.ListFormat.ConvertNumbersToText
        End If
    Next oPara
    
    With docToProcess.Content.Find
        .ClearFormatting
        .Replacement.ClearFormatting
        .Execute FindText:="【题号】", ReplaceWith:="=end^p【题号】", Forward:=True, Format:=False, MatchWildcards:=False, Replace:=wdReplaceAll
    End With
    
    docToProcess.Content.Select
    Selection.InsertAfter vbCrLf & "=end"
End Sub

Private Sub ConvertListsInBodyToHtml(docToProcess As Document)
' 题干、答案或解析中项目编号转成 HTML

    Debug.Print "ConvertListsInBodyToHtml"

    Dim oList As List
    Dim oPara As Paragraph
    
    For Each oList In docToProcess.Lists
        With oList.Range
            .MoveStart Unit:=wdCharacter, Count:=-1
            .Select
        End With
        
        ' 在 List 的首尾加上 <ol></ol> <ul type="A|1"></ul> HTML标签
        With oList.listParagraphs(1).Range.ListFormat
            If .ListType = WdListType.wdListSimpleNumbering Then
                Selection.InsertBefore (vbCrLf & "<ol type=""" & Left(.ListString, 1) & """>")
                Selection.InsertAfter ("</ol>" & vbCrLf)
            End If
            
            If .ListType = WdListType.wdListBullet Then
                Selection.InsertBefore (vbCrLf & "<ul>")
                Selection.InsertAfter ("</ul>" & vbCrLf)
            End If
        End With
        
        Dim strStyleName As String
        
        If StyleExists("正文", docToProcess) = True Then
            strStyleName = "正文"
        ElseIf StyleExists("Normal", docToProcess) = True Then
            strStyleName = "Normal"
        End If
        
        ' 列表项两端加 <li></li> 标签
        For Each oPara In oList.listParagraphs
            With oPara.Range
                .Style = strStyleName
                .Text = "<li>" & .Text & "</li>"
            End With
        Next
    Next
    
    ' 处理独立成行的 </li> 标签
    With docToProcess.Content.Find
        .ClearFormatting
        .Replacement.ClearFormatting
        .Execute FindText:="^p</li>", ReplaceWith:="</li>", Forward:=True, Replace:=wdReplaceAll, MatchWildcards:=False
        .Execute FindText:="<ul>^p", ReplaceWith:="<ul>", Forward:=True, Replace:=wdReplaceAll, MatchWildcards:=False
        .Execute FindText:="(\<ol[!>]@\>)^13", ReplaceWith:="\1", Forward:=True, Replace:=wdReplaceAll, MatchWildcards:=True
        .Execute FindText:="</ul>^p<ul>", ReplaceWith:="</ul><ul>", Forward:=True, Replace:=wdReplaceAll, MatchWildcards:=False
        .Execute FindText:="</ul>^p<ol", ReplaceWith:="</ul><ol", Forward:=True, Replace:=wdReplaceAll, MatchWildcards:=False
        .Execute FindText:="</ol>^p<ul>", ReplaceWith:="</ol><ul>", Forward:=True, Replace:=wdReplaceAll, MatchWildcards:=False
        .Execute FindText:="</ol>^p<ol", ReplaceWith:="</ul><ol", Forward:=True, Replace:=wdReplaceAll, MatchWildcards:=False
    End With
End Sub

Private Sub ProcessQuestionBody(docToProcess As Document)
' 处理题干
    
    Debug.Print "ProcessQuestionBody"
    
    Dim oRange As Range
    Dim oPara As Paragraph
    Dim strBody As String
    Dim strPara As String
    
    ' 【题干】 独立成行
    With docToProcess.Content.Find
        .ClearFormatting
        .Replacement.ClearFormatting
        .Execute FindText:="【题干】", ReplaceWith:="【题干】^p", Forward:=True, Format:=False, Replace:=wdReplaceAll, MatchWildcards:=False
    End With
    
    ' 遍历【题干】和【 之间的部分
    Set oRange = docToProcess.Range
    With oRange.Find
        .ClearFormatting
        .Replacement.ClearFormatting
        .Execute FindText:="【题干】*【", Forward:=True, Format:=False, MatchWildcards:=True
        
        Do While .Found = True
            oRange.MoveStart Unit:=wdCharacter, Count:=5
            oRange.MoveEnd Unit:=wdCharacter, Count:=-1
            'Debug.Print oRange.Text
            oRange.Select
            
            strBody = ""
            For Each oPara In Selection.Range.Paragraphs
                strPara = oPara.Range.Text
                strPara = Replace(strPara, vbCrLf, "")
                strPara = Replace(strPara, vbCr, "")
                strBody = strBody & "<p>" & strPara & "</p>"
            Next oPara
            'Debug.Print strBody
            
            Selection.Cut
            Selection.InsertBefore strBody & vbCrLf
            
            .Execute
        Loop
    End With
    
    ' 剔除多余的 <p></p> 标签
    With docToProcess.Content.Find
        .ClearFormatting
        .Replacement.ClearFormatting
        .Execute FindText:="<p><ol", ReplaceWith:="<ol", Forward:=True, Replace:=wdReplaceAll, MatchWildcards:=False
        .Execute FindText:="</ol></p>", ReplaceWith:="</ol>", Forward:=True, Replace:=wdReplaceAll, MatchWildcards:=False
        .Execute FindText:="<p><ul>", ReplaceWith:="<ul>", Forward:=True, Replace:=wdReplaceAll, MatchWildcards:=False
        .Execute FindText:="</ul></p>", ReplaceWith:="</ul>", Forward:=True, Replace:=wdReplaceAll, MatchWildcards:=False
        .Execute FindText:="【题干】^p", ReplaceWith:="=body#", Forward:=True, Replace:=wdReplaceAll, MatchWildcards:=False
    End With
End Sub

Private Sub ProcessAnswer(docToProcess As Document)
' 处理主题观的答案
    
    Debug.Print "ProcessAnswer"
    
    Dim oRange As Range
    Dim oPara As Paragraph
    Dim strBody As String
    Dim strPara As String
    
    ' 【答案】 独立成行
    With docToProcess.Content.Find
        .ClearFormatting
        .Replacement.ClearFormatting
        .Execute FindText:="【答案】", ReplaceWith:="【答案】^p", Forward:=True, Format:=False, Replace:=wdReplaceAll, MatchWildcards:=False
        ' 避免出现空行干扰处理流程
        .Execute FindText:="^13{2,}", ReplaceWith:="^p", Forward:=True, Format:=False, Replace:=wdReplaceAll, MatchWildcards:=True
    End With
    
    ' 遍历【答案】和【 之间的部分
    Set oRange = docToProcess.Range
    With oRange.Find
        .ClearFormatting
        .Replacement.ClearFormatting
        .Execute FindText:="【答案】*【", Forward:=True, Format:=False, MatchWildcards:=True
        
        Do While .Found = True
            oRange.MoveStart Unit:=wdCharacter, Count:=5
            oRange.MoveEnd Unit:=wdCharacter, Count:=-1
            'Debug.Print oRange.Text
            oRange.Select
            
            If Len(Replace(Replace(Selection.Text, vbCrLf, ""), vbCr, "")) > 1 Then ' 避免出现有【答案】标记但无内容的情况
                strBody = ""
                For Each oPara In Selection.Range.Paragraphs
                    strPara = oPara.Range.Text
                    strPara = Replace(strPara, vbCrLf, "")
                    strPara = Replace(strPara, vbCr, "")
                    
                    If Len(strPara) Then
                        strBody = strBody & "<p>" & strPara & "</p>"
                    End If
                Next oPara
                'Debug.Print strBody
                
                If Len(Selection) And Selection.Text <> "" Then
                    Selection.Cut
                    Selection.InsertBefore strBody & vbCrLf
                End If
            End If
            
            .Execute
        Loop
    End With
    
    ' 剔除多余的 <p></p> 标签
    With docToProcess.Content.Find
        .ClearFormatting
        .Replacement.ClearFormatting
        .Execute FindText:="<p><ol", ReplaceWith:="<ol", Forward:=True, Replace:=wdReplaceAll, MatchWildcards:=False
        .Execute FindText:="</ol></p>", ReplaceWith:="</ol>", Forward:=True, Replace:=wdReplaceAll, MatchWildcards:=False
        .Execute FindText:="<p><ul>", ReplaceWith:="<ul>", Forward:=True, Replace:=wdReplaceAll, MatchWildcards:=False
        .Execute FindText:="</ul></p>", ReplaceWith:="</ul>", Forward:=True, Replace:=wdReplaceAll, MatchWildcards:=False
        .Execute FindText:="【答案】^p", ReplaceWith:="^p=answer#", Forward:=True, Replace:=wdReplaceAll, MatchWildcards:=False
    End With
End Sub

Private Sub ProcessQuestionOption(docToProcess As Document)
' 处理选项

    Debug.Print "ProcessQuestionOption"
    
    Dim oRange As Range
    Dim i As Integer
    Dim strOptions As String
    Dim strOptionAnswer As String
    
    ' 整理选项
    With docToProcess.Content.Find
        .ClearFormatting
        .Replacement.ClearFormatting
        .Execute FindText:="^13([A-Z])[.． ^9]{1,}", ReplaceWith:="^p\1#", Forward:=True, Format:=False, Replace:=wdReplaceAll, MatchWildcards:=True
    End With
    
    ' 查找选项区域
    Set oRange = docToProcess.Range
    With oRange.Find
        .ClearFormatting
        .Replacement.ClearFormatting
        .Execute FindText:="【选项】*【答案】[A-Z]{1,}^13", Forward:=True, Format:=False, MatchWildcards:=True
        
        Do While .Found = True
            strOptions = oRange.Text
            oRange.Select
            'Debug.Print strOptions
            
            strOptionAnswer = Mid(oRange.Text, InStr(1, oRange.Text, "【答案】") + 4)
            strOptionAnswer = Replace(strOptionAnswer, vbCrLf, "")
            strOptionAnswer = Replace(strOptionAnswer, vbCr, "")
            'Debug.Print strOptionAnswer
            
            ' 添加正确选项的标记
            For i = 1 To Len(strOptionAnswer)
                strOptions = Replace(strOptions, Mid(strOptionAnswer, i, 1) & "#", Mid(strOptionAnswer, i, 1) & "#T#")
            Next
            
            'Debug.Print strOptions
            
            ' 替换到文档中
            oRange.Cut
            oRange.InsertBefore strOptions
            
            .Execute
        Loop
    End With
    
    ' 把选项替换成 =option# 开头的格式
    ' 剔除【选项】行
    ' 剔除选择题的【答案】行
    With docToProcess.Range.Find
        .ClearFormatting
        .Replacement.ClearFormatting
        .Execute FindText:="^13[A-Z]#", ReplaceWith:="^p=option#", Forward:=True, Format:=False, Replace:=wdReplaceAll, MatchWildcards:=True
        .Execute FindText:="【选项】^p", ReplaceWith:="", Forward:=True, Format:=False, Replace:=wdReplaceAll, MatchWildcards:=False
        .Execute FindText:="^13【答案】[A-D]{1,}^13", ReplaceWith:="^p", Forward:=True, Format:=False, Replace:=wdReplaceAll, MatchWildcards:=True
    End With
End Sub

Private Sub ConvertSuperscriptToHtml(docToProcess As Document)
' 把上标转为 <sup></sup>

    Debug.Print "ConvertSuperscriptToHtml"

    docToProcess.Select
   
    With Selection.Find
   
        .ClearFormatting
        .Font.Superscript = True
        .Text = ""
       
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
       
        .Forward = True
        .Wrap = wdFindContinue
       
        Do While .Execute
            With Selection
                If InStr(1, .Text, vbCr) Then
                    ' Just process the chunk before any newline characters
                    ' We'll pick-up the rest with the next search
                    .Font.Superscript = False
                    .Collapse
                    .MoveEndUntil vbCr
                End If
                                       
                ' Don't bother to markup newline characters (prevents a loop, as well)
                If Not .Text = vbCr Then
                    .InsertBefore "<sup>"
                    .InsertAfter "</sup>"
                End If
               
                .Font.Superscript = False
            End With
        Loop
    End With
End Sub

Private Sub ConvertSubscriptToHtml(docToProcess As Document)
' 把下标转为 <sub></sub>

    Debug.Print "ConvertSubscriptToHtml"

    docToProcess.Select
   
    With Selection.Find
   
        .ClearFormatting
        .Font.Subscript = True
        .Text = ""
       
        .Format = True
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
       
        .Forward = True
        .Wrap = wdFindContinue
       
        Do While .Execute
            With Selection
                If InStr(1, .Text, vbCr) Then
                    ' Just process the chunk before any newline characters
                    ' We'll pick-up the rest with the next search
                    .Font.Subscript = False
                    .Collapse
                    .MoveEndUntil vbCr
                End If
                                       
                ' Don't bother to markup newline characters (prevents a loop, as well)
                If Not .Text = vbCr Then
                    .InsertBefore "<sub>"
                    .InsertAfter "</sub>"
                End If
               
                .Font.Subscript = False
            End With
        Loop
    End With
End Sub

Private Sub SaveImagesToDiskFiles(docToProcess As Document)
' 把图片另存为文件
' 并把文本图片替换为形如 [img]201809121523_001.jpg[/img] 的 BBCode 形式

    Debug.Print "SaveImagesToDiskFiles"

    ' Shape 需先转为 InlineShape
    Dim objShape As Shape
    For Each objShape In docToProcess.Shapes
        objShape.ConvertToInlineShape
    Next objShape
    
    Dim objInlineShape As InlineShape
    Dim byteData() As Byte
    Dim i As Long
    Dim intWritePos As Long
    Dim strOutFilePath As String
    Dim strPictureFileName As String
    Dim strDateTime As String
    
    strDateTime = Format(Now(), "YYYYMMDDHHmm_") ' 当前时间 年月日时分
    
    For i = docToProcess.InlineShapes.Count To 1 Step -1
        Set objInlineShape = docToProcess.InlineShapes(i)
        objInlineShape.Select
        
        strPictureFileName = strDateTime & PadNumber(CStr(i), 2)
        ' 先存成 emf，后续 check 生成文件时再转为 jpg
        strOutFilePath = docToProcess.Path & Application.PathSeparator & strPictureFileName & ".emf"
        
        ' 生成文件
        Open strOutFilePath For Binary Access Write As #1
        byteData = objInlineShape.Range.EnhMetaFileBits
        intWritePos = 1
        Put #1, intWritePos, byteData
        Close #1
        
        ' 替换文件的图片
        Selection.Cut
        Selection.InsertBefore "[img]" & strPictureFileName & ".jpg[/img]" & vbCrLf
    Next i
    
    With docToProcess.Content.Find
        .ClearFormatting
        .Execute FindText:="^13{2,}", ReplaceWith:="^p", Forward:=True, Format:=False, MatchWildcards:=True, Replace:=wdReplaceAll
    End With
End Sub

Private Sub ConvertEmfToJpg(docToProcess As Document)
' 把生成的 emf 转成 jpg

    Debug.Print "ConvertEmfToJpg"

    Dim imgFileName As String
    Dim newFileName As String
    Dim strCmd As String
    
    ChDrive Left(docToProcess.Path, 1)
    ChDir docToProcess.Path
    
    imgFileName = Dir("*.emf")
    Do While imgFileName <> ""
        newFileName = Replace(imgFileName, ".emf", ".jpg")
        ' cmd /S /C magick 201809171713_01.emf 201809171713_01.jpg && del 201809171713_01.emf
        strCmd = "cmd /S /C magick " & imgFileName & " " & newFileName & " && del " & imgFileName
        'Debug.Print strCmd
        Call Shell(strCmd, vbHide)
        
        imgFileName = Dir()
    Loop
    
End Sub

Private Sub SaveMeToTxt(docToProcess As Document)
' 保存成文本文件

    Debug.Print "SaveMeToTxt"
    
    Dim strFilePath As String
    strFilePath = docToProcess.Path & Application.PathSeparator & docToProcess.Name
    strFilePath = Mid(strFilePath, 1, InStrRev(strFilePath, ".") - 1)
    
    docToProcess.SaveAs2 FileName:=strFilePath, FileFormat:= _
        wdFormatText, LockComments:=False, Password:="", AddToRecentFiles:=False, _
        WritePassword:="", ReadOnlyRecommended:=False, EmbedTrueTypeFonts:=False, _
         SaveNativePictureFormat:=False, SaveFormsData:=False, SaveAsAOCELetter:= _
        False, Encoding:=65001, InsertLineBreaks:=False, AllowSubstitutions:= _
        False, LineEnding:=wdLFOnly, CompatibilityMode:=0
    docToProcess.Close
End Sub

Private Function PadNumber(intNumber As Integer, intLength As Integer) As String
' 数字前缀 0

    Dim strZeros As String
    Dim i As Integer
    For i = 1 To intLength
        strZeros = strZeros & "0"
    Next
    
    PadNumber = Right(strZeros & CStr(intNumber), intLength)
End Function

Private Function EndsWith(str As String, ending As String) As Boolean
' 字符串是否以某字符串为结尾

     Dim endingLen As Integer
     endingLen = Len(ending)
     EndsWith = (Right(Trim(UCase(str)), endingLen) = UCase(ending))
End Function

Private Function StartsWith(str As String, start As String) As Boolean
' 字符串是否以某字符串为开头

     Dim startLen As Integer
     startLen = Len(start)
     StartsWith = (Left(Trim(UCase(str)), startLen) = UCase(start))
End Function

Private Function StyleExists(strStyleName As String, doc As Document) As Boolean
' 指定 Document 中是否有指定样式
    
    Dim objStyle As Style
    
    StyleExists = False
    
    For Each objStyle In doc.Styles
        If objStyle.NameLocal = strStyleName Then
            StyleExists = True
            Exit For
        End If
    Next objStyle
End Function
