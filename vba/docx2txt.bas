Attribute VB_Name = "模块1"
Option Explicit
Option Base 1

Sub Docx2Txt()
    ' main 方法，处理当前文档
    ' 注意：
    ' 1. 本文档为 docm 启用宏的 Word 文档，请在初次打开时启用宏
    ' 2. 本文档含有 body 基础样式用于格式化文档，请勿删除，如丢失可基于正文样式添加一个名为 body 的样式
    ' 3. 把待处理的文件内容粘贴至本文档，粘贴选项选择“合并格式”
    ' 4. 如文档中含有图片，将在本文档同目录中生成 .emf 中间格式图片文件，为避免混乱，可将本文档放置于新建的空白文件夹中
    
    ' 基本样式全文置为 body 样式
    PreprocessDocumentFormat
    
    ' 必要的格式转为 HTML 标签
    ConvertSuperscriptToHtml
    ConvertSubscriptToHtml
    
    ' 选项中项目编号转为文本
    ' 注意：这个要先于题干或解析里的项目编号处理掉
    ConvertListsInOptionsToText
    
    ' 题干和答案中的列表转为 ol,ul 等 HTML 标签
    ' 目前只支持一级列表，嵌套列表后续完善
    ConvertListsInBodyToHtml
    
    ' 表格转为 HTML 标签
    ' 目前只支持普通表格和有横向单元格合并的表格
    ' 后续完善有纵向单元格合并的表格
    ConvertTablesToHtml
    
    ' 导出文档中所有的图片
    ' 导出 emf 格式文件，再转为 jpg
    SaveImagesToDiskFiles
    
    ' 处理题目属性字段
    ' 把分类、题号、题型等题目字段转成待导入的格式
    PrepareQuestionAttr

    ' 另存为 txt
    SaveMeToTxt
End Sub

Private Sub PreprocessDocumentFormat()
    ' 预处理格式
    ActiveDocument.Select
    
    With Selection.Find
        .ClearFormatting
        .Execute FindText:="^l", ReplaceWith:="^p", Forward:=True, Format:=False, MatchWildcards:=False, Replace:=wdReplaceAll
        .Execute FindText:="^13{2,}", ReplaceWith:="^p", Forward:=True, Format:=False, MatchWildcards:=True, Replace:=wdReplaceAll
        .Execute FindText:="^13[ 　^9]{1,}", ReplaceWith:="^p", Forward:=True, Format:=False, MatchWildcards:=True, Replace:=wdReplaceAll
        .Execute FindText:="[ 　^9]{1,}^13", ReplaceWith:="^p", Forward:=True, Format:=False, MatchWildcards:=True, Replace:=wdReplaceAll
    End With
End Sub

Private Sub PrepareQuestionAttr()
    ActiveDocument.Select
    
    With Selection.Find
        .ClearFormatting
        .Execute FindText:="(【题号】*)(【题号】)", ReplaceWith:="\1=end^p\2", Forward:=True, Format:=False, MatchWildcards:=True, Replace:=wdReplaceAll
        .Execute FindText:="【分类】", ReplaceWith:="=category#", Forward:=True, Format:=False, MatchWildcards:=False, Replace:=wdReplaceAll
        .Execute FindText:="【题号】", ReplaceWith:="=no#", Forward:=True, Format:=False, MatchWildcards:=False, Replace:=wdReplaceAll
        .Execute FindText:="【题型】单选", ReplaceWith:="=type#single_choice", Forward:=True, Format:=False, MatchWildcards:=False, Replace:=wdReplaceAll
        .Execute FindText:="【题型】多选", ReplaceWith:="=type#multiple_choice", Forward:=True, Format:=False, MatchWildcards:=False, Replace:=wdReplaceAll
        .Execute FindText:="【题型】问答", ReplaceWith:="=type#subjective_question", Forward:=True, Format:=False, MatchWildcards:=False, Replace:=wdReplaceAll
        .Execute FindText:="【难度】★★★", ReplaceWith:="=level#3", Forward:=True, Format:=False, MatchWildcards:=False, Replace:=wdReplaceAll
        .Execute FindText:="【难度】★★", ReplaceWith:="=level#2", Forward:=True, Format:=False, MatchWildcards:=False, Replace:=wdReplaceAll
        .Execute FindText:="【难度】★", ReplaceWith:="=level#1", Forward:=True, Format:=False, MatchWildcards:=False, Replace:=wdReplaceAll
        .Execute FindText:="【特殊】△", ReplaceWith:="=special#T", Forward:=True, Format:=False, MatchWildcards:=False, Replace:=wdReplaceAll
        .Execute FindText:="【特殊】", ReplaceWith:="=special#", Forward:=True, Format:=False, MatchWildcards:=False, Replace:=wdReplaceAll
        .Execute FindText:="【答题格式】横线", ReplaceWith:="=format#grid", Forward:=True, Format:=False, MatchWildcards:=False, Replace:=wdReplaceAll
        .Execute FindText:="【答题格式】表格", ReplaceWith:="=format#table", Forward:=True, Format:=False, MatchWildcards:=False, Replace:=wdReplaceAll
    End With
End Sub

Private Sub ConvertTablesToHtml()
    ' 把表格转为 HTML 代码
    Dim oTable As Table
    Dim i As Integer
    
    ' 表格前后加空行
    For i = ActiveDocument.Tables.Count To 1 Step -1
        ActiveDocument.Tables(i).Range.Select
        With Selection
            .Cut
            .Text = vbCrLf & vbCrLf & vbCrLf
            .End = .End - 1
            .start = .start + 1
            .Paste
        End With
    Next
    
    IterateTables
    
End Sub

Private Sub IterateTables()
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
    For i = ActiveDocument.Tables.Count To 1 Step -1
        Set objTable = ActiveDocument.Tables(i)
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

Private Sub ConvertListsInOptionsToText()
    ' 选项中的项目编号转成文字
    ' 先把选项中的项目编号处理掉，再用 ConvertListsInQuestionBodyToHtml 处理题干中的项目编号
    Dim lp As Paragraph
    
    ActiveDocument.Select
    
    With Selection.Find
        .ClearFormatting
        .Replacement.ClearFormatting
        .Execute FindText:="【选项】*【答案】", Forward:=True, Format:=False, MatchWildcards:=True
        
        Do While .Found = True
            For Each lp In Selection.Range.listParagraphs
                lp.Range.ListFormat.ConvertNumbersToText
            Next lp
            
            .Execute
        Loop
    End With
End Sub

Private Sub ConvertListsInBodyToHtml()
    ' 题干、答案或解析中项目编号转成 HTML
    Dim oList As List
    Dim oPara As Paragraph
    
    For Each oList In ActiveDocument.Lists
        With oList.Range
            .MoveStart unit:=wdCharacter, Count:=-1
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
        
        ' 列表项两端加 <li></li> 标签
        For Each oPara In oList.listParagraphs
    
            With oPara.Range
                .Style = "body" ' 这里同样需要基础样式 body
                .Text = "<li>" & .Text & "</li>"
            End With
        Next
    Next
    
    ' 处理独立成行的 </li> 标签
    With ActiveDocument.Content.Find
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

Private Sub ProcessQuestionBody()
    Dim oRange As Range
    Dim oPara As Paragraph
    
    With ActiveDocument.Content.Find
        .ClearFormatting
        .Replacement.ClearFormatting
        .Execute FindText:="【题干】", ReplaceWith:="【题干】^p", Forward:=True, Format:=False, Replace:=wdReplaceAll, MatchWildcards:=False
    End With
    
    Set oRange = ActiveDocument.Range
    With oRange.Find
        .ClearFormatting
        .Replacement.ClearFormatting
        .Execute FindText:="【题干】*【选项】", Forward:=True, Format:=False, MatchWildcards:=True
        
        Do While .Found = True
            For Each oPara In oRange.Paragraphs
                oPara.Range.Text = "<p>" & oPara.Range.Text & "</p>"
            Next oPara
            
            .Execute
        Loop
    End With
End Sub

Private Sub ProcessQuestionOption()
    Dim oRange As Range
    Dim i As Integer
    Dim strOptions As String
    Dim strOptionAnswer As String
    
    ' 整理选项
    With ActiveDocument.Content.Find
        .ClearFormatting
        .Replacement.ClearFormatting
        .Execute FindText:="^13([A-Z])[.． ]^9", ReplaceWith:="^p\1#", Forward:=True, Format:=False, Replace:=wdReplaceAll, MatchWildcards:=True
    End With
    
    ' 查找选项区域
    Set oRange = ActiveDocument.Range
    With oRange.Find
        .ClearFormatting
        .Replacement.ClearFormatting
        .Execute FindText:="【选项】*【答案】[A-Z]{1,}^13", Forward:=True, Format:=False, MatchWildcards:=True
        
        Do While .Found = True
            strOptions = oRange.Text
            Debug.Print strOptions
            
            strOptionAnswer = Mid(oRange.Text, InStr(1, oRange.Text, "【答案】") + 4)
            strOptionAnswer = Replace(strOptionAnswer, vbCrLf, "")
            strOptionAnswer = Replace(strOptionAnswer, vbCr, "")
            Debug.Print strOptionAnswer
            
            ' 添加正确选项的标记
            For i = 1 To Len(strOptionAnswer)
                strOptions = Replace(strOptions, Mid(strOptionAnswer, i, 1) & "#", Mid(strOptionAnswer, i, 1) & "#T#")
            Next
            
            Debug.Print strOptions
            
            ' 替换到文档中
            oRange.Cut
            oRange.InsertBefore strOptions
            
            .Execute
        Loop
    End With
    
    ' 把选项替换成 =option# 开头的格式
    ' 剔除【选项】行
    ' 剔除选择题的【答案】行
    Set oRange = ActiveDocument.Range
    With oRange.Find
        .ClearFormatting
        .Replacement.ClearFormatting
        .Execute FindText:="^13[A-Z]#", ReplaceWith:="^p=option#", Forward:=True, Format:=False, Replace:=wdReplaceAll, MatchWildcards:=True
        .Execute FindText:="【选项】^p", ReplaceWith:="", Forward:=True, Format:=False, Replace:=wdReplaceAll, MatchWildcards:=False
        .Execute FindText:="^13【答案】[A-D]{1,}^13", ReplaceWith:="^p", Forward:=True, Format:=False, Replace:=wdReplaceAll, MatchWildcards:=True
    End With
End Sub

Private Sub ConvertSuperscriptToHtml()
    ' 把上标转为 <sup></sup>

    ActiveDocument.Select
   
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

Private Sub ConvertSubscriptToHtml()
    ' 把下标转为 <sub></sub>

    ActiveDocument.Select
   
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

Private Sub SaveImagesToDiskFiles()
    ' 把图片另存为文件
    ' 并把文本图片替换为形如 [img]201809121523_001.jpg[/img] 的 BBCode 形式

    Dim objShape As InlineShape
    Dim byteData() As Byte
    Dim i As Long
    Dim intWritePos As Long
    Dim strOutFilePath As String
    Dim strPictureFileName As String
    Dim strDateTime As String
    
    strDateTime = Format(Now(), "YYYYMMDDHHmm_") ' 当前时间 年月日时分
    
    For i = ActiveDocument.InlineShapes.Count To 1 Step -1
        Set objShape = ActiveDocument.InlineShapes(i)
        objShape.Select
        
        strPictureFileName = strDateTime & PadNumber(CStr(i), 2)
        ' 先存成 emf，后续 check 生成文件时再转为 jpg
        strOutFilePath = ActiveDocument.Path & Application.PathSeparator & strPictureFileName & ".emf"
        
        ' 生成文件
        Open strOutFilePath For Binary Access Write As #1
        byteData = objShape.Range.EnhMetaFileBits
        intWritePos = 1
        Put #1, intWritePos, byteData
        Close #1
        
        ' 替换文件的图片
        Selection.Cut
        Selection.InsertBefore "[img]" & strPictureFileName & ".emf[/img]"
    Next i
End Sub

Private Sub SaveMeToTxt()
    ' 保存成文本文件
    Dim strFileName As String
    Dim strFilePath As String
    
    strFileName = ActiveDocument.Name
    strFilePath = ActiveDocument.Path & Application.PathSeparator & strFileName
    
    ActiveDocument.SaveAs2 FileName:=strFilePath, FileFormat:= _
        wdFormatText, LockComments:=False, Password:="", AddToRecentFiles:=True, _
        WritePassword:="", ReadOnlyRecommended:=False, EmbedTrueTypeFonts:=False, _
         SaveNativePictureFormat:=False, SaveFormsData:=False, SaveAsAOCELetter:= _
        False, Encoding:=936, InsertLineBreaks:=False, AllowSubstitutions:=False, _
         LineEnding:=wdCRLF, CompatibilityMode:=0
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
