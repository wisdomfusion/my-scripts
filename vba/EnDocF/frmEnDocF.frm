VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} frmEnDocF 
   Caption         =   "英语试卷批处理 v2.0"
   ClientHeight    =   3150
   ClientLeft      =   20595
   ClientTop       =   6465
   ClientWidth     =   4800
   OleObjectBlob   =   "frmEnDocF.frx":0000
   ShowModal       =   0   'False
   StartUpPosition =   1  '所有者中心
End
Attribute VB_Name = "frmEnDocF"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub btnAdjustDocFormat_Click()
' 规范文档格式

WfAdjustDocFormat
End Sub

Private Sub btnInsertChoiceLine_Click()
' 插入选择题横线

Selection.TypeText Text:="________"
End Sub

Private Sub btnInsertCompositionLines_Click()
' 插入作文横线

Dim line, lines As String
Dim i, j As Integer

' 一行60个_
line = ""
For i = 1 To 60
    line = line & "_"
Next i

' 共7行
lines = ""
For i = 1 To 7
    lines = lines & vbCrLf & line
Next i

Selection.TypeText lines
End Sub

Private Sub btnInsertContinuousNo_Click()
'插入连续编号

Selection.TypeText Text:="___n___"
End Sub

Private Sub btnInsertFillInBlanksLine_Click()
' 插入填空横线

Selection.TypeText Text:="_____________"
End Sub

Private Sub btnInsertDialogPrefix_Click()
' 插入对话横线

Selection.TypeText Text:="—"
End Sub

Private Sub btnInsertChoiceAnalysisTemplate_Click()
' 插入题型解析模板：选择题

Selection.TypeText AnalysisTemplate("CHOICE")
End Sub

Private Sub btnInsertFillInBlanksAnalysisTemplate_Click()
' 插入题型解析模板：填空题

Selection.TypeText AnalysisTemplate("FILL_IN_BLANKS")
End Sub

Private Sub btnInsertComprehensiveAnalysisTemplate_Click()
' 插入题型解析模板：综合题

Selection.TypeText AnalysisTemplate("COMPREHENSIVE")
End Sub

Private Sub btnInsertCompositionAnalysisTemplate_Click()
'插入题型解析模板：作文

Selection.TypeText AnalysisTemplate("COMPOSITION")
End Sub

Private Function AnalysisTemplate(ByVal questionType As String) As String
'题型解析模板

Dim str As String
str = ""

Select Case questionType
    Case "CHOICE"
        str = "n." & vbCrLf & "【解答】" & vbCrLf & "故选：" & vbCrLf
    Case "FILL_IN_BLANKS"
        str = "n." & vbCrLf & "【解答】" & vbCrLf & "故答案为：" & vbCrLf
    Case "COMPREHENSIVE"
        str = "n." & vbCrLf & "【解答】(1)故答案为：" & vbCrLf _
        & "(2)故答案为：" & vbCrLf _
        & "(3)故答案为：" & vbCrLf _
        & "(4)故答案为：" & vbCrLf _
        & "(5)故答案为：" & vbCrLf
    Case "COMPOSITION"
        str = "n." & vbCrLf & "【解答】One possible version:" & vbCrLf
    Case Else
        str = ""
End Select

AnalysisTemplate = str
End Function

Private Sub WfAdjustDocFormat()
' 文档格式调整

If HasStyle("正文") = False Then
    MsgBox ("请检查“正文”样式是否存在！")
    Exit Sub
End If

Application.ScreenUpdating = False

' 替换前的准备工作
PrepareForReplace

' 已有空行标记 ==
WfMarkBlankLine

' 双段落标记，避免上下段落样式在替换时交叉
With Selection.Find
    .MatchWildcards = False
    .Text = "^p{1,}"
    .Replacement.Text = "^p^p"
    .Wrap = wdFindContinue
    .Execute Replace:=wdReplaceAll
End With

' 已有首行缩进的段落加标记【【
WfMarkFirstLineIndent

' 调整“正文”样式
WfAdjustBodyStyle

' 全文应用“正文”样式
ApplyBodyStyle

' 还原首行缩进
WfRestoreFirstLineIndent

' 移除空括号
WfRemoveEmptyBrackets

' 给√×统一设定字体
ApplyFontToTF

' 规范选择题编号 A. B. C. D.
AdjustChoiceNo

' 规范标点符号
WfAdjustPuncuation

' 统一题目编号
WfUniteQuestionNo

' 图片单倍行距
WfPictureLineSpaceSingle

' 收尾，移除不必要的空格、段落标记等
RemovePrepareRedundance

' 还原空行
WfRestoreBlankLine

Application.ScreenUpdating = True

MsgBox "文档格式调整 DONE!"

End Sub

Private Sub PrepareForReplace()
' 替换前的准备工作

Application.ScreenUpdating = False

With ActiveDocument.Content.Find
    .ClearFormatting
    .Replacement.ClearFormatting
    .Forward = True
    .Wrap = wdFindContinue
    
    ' 不间断空格替换为英文空格
    .Execute FindText:="^s", ReplaceWith:=" ", MatchWildcards:=True, Replace:=wdReplaceAll
    
    ' 移除行首空格
    .Execute FindText:="^13[ 　]{1,}", ReplaceWith:="^p", MatchWildcards:=True, Replace:=wdReplaceAll
End With

Application.ScreenUpdating = True

End Sub

Private Sub RemovePrepareRedundance()
' 收尾，移除不必要的空格、段落标记等

Application.ScreenUpdating = False

With ActiveDocument.Content.Find
    .ClearFormatting
    .Replacement.ClearFormatting
    .Forward = True
    .Wrap = wdFindContinue
    
    ' 移除多余段落标记
    .Execute FindText:="^13{2,}", ReplaceWith:="^p", MatchWildcards:=True, Replace:=wdReplaceAll
    
    ' 移除多余空格
    .Execute FindText:=" {2,}", ReplaceWith:=" ", MatchWildcards:=True, Replace:=wdReplaceAll
    
    ' 移除行首空格
    .Execute FindText:="^13[ 　]{1,}", ReplaceWith:="^p", MatchWildcards:=True, Replace:=wdReplaceAll
    
    ' 移除行尾空格
    .Execute FindText:="[ 　]{1,}^13", ReplaceWith:="^p", MatchWildcards:=True, Replace:=wdReplaceAll
    
    ' 清理多余的【【
    .Execute FindText:="【【", ReplaceWith:="", MatchWildcards:=False, Replace:=wdReplaceAll
End With

Application.ScreenUpdating = True

End Sub

Private Sub WfAdjustBodyStyle()
' 调整“正文”样式

Dim oDoc As Document
Set oDoc = ActiveDocument
Dim oStyle As Style

With oDoc.Styles("正文").Font
    .NameFarEast = "思源黑体 Regular"
    .NameAscii = "Verdana"
    .NameOther = "Verdana"
    .Name = "Verdana"
    .Size = 10
    .Color = wdColorBlack
End With

With oDoc.Styles("正文").ParagraphFormat
    .LeftIndent = CentimetersToPoints(0)
    .RightIndent = CentimetersToPoints(0)
    .SpaceBefore = 0
    .SpaceBeforeAuto = False
    .SpaceAfter = 0
    .SpaceAfterAuto = False
    .LineSpacingRule = wdLineSpaceExactly
    .LineSpacing = 22
    .Alignment = wdAlignParagraphJustify
    .CharacterUnitLeftIndent = 0
    .CharacterUnitRightIndent = 0
    .CharacterUnitFirstLineIndent = 0
End With

If Not HasStyle("正文_Indent2") Then
    Set oStyle = oDoc.Styles.Add("正文_Indent2")
    oStyle.BaseStyle = oDoc.Styles("正文")
    oStyle.ParagraphFormat.CharacterUnitFirstLineIndent = 2
End If

End Sub

Private Sub ApplyBodyStyle()
' 全文应用“正文”样式

Selection.WholeStory

With Selection
    .Style = ActiveDocument.Styles("正文")
    
    With .Font
        .Color = vbBlack
        .Size = 10
        .NameFarEast = "思源黑体 Regular"
        .NameAscii = "Verdana"
        .NameOther = "Verdana"
        .Name = "Verdana"
    End With
End With
Selection.Style = ActiveDocument.Styles("正文")

' 逐字设置字体
' 这种方式有些暴力，而且有好多情况不好处理，还是换成上述方式吧
'Set oRange = ActiveDocument.Characters
'For Each oWord In oRange
'    ' 参考 ASCII Table：http://www.asciitable.com/
'    If Asc(oWord.Text) >= 33 And Asc(oWord.Text) <= 127 Then
'        oWord.Font.Name = "Verdana"
'    Else
'        oWord.Font.Name = "思源黑体 Regular"
'    End If
'Next

End Sub

Private Sub WfMarkBlankLine()
' 已有空行标记 ==

With ActiveDocument.Content.Find
    .ClearFormatting
    .Replacement.ClearFormatting
    .Text = "^13^13"
    .Replacement.Text = "^p==^p"
    .MatchWildcards = True
    .Wrap = wdFindContinue
    .Execute Replace:=wdReplaceAll
End With

End Sub

Private Sub WfRestoreBlankLine()
' 还原空行

With ActiveDocument.Content.Find
    .ClearFormatting
    .Replacement.ClearFormatting
    .Text = "==^13"
    .Replacement.Text = "^p"
    .MatchWildcards = True
    .Wrap = wdFindContinue
    .Execute Replace:=wdReplaceAll
End With

End Sub

Private Sub WfMarkFirstLineIndent()
' 已有首行缩进的段落加标记【【

Dim oPara As Paragraph
For Each oPara In ActiveDocument.Paragraphs
    If oPara.Format.FirstLineIndent > 0 Then
        oPara.Range.Select
        Selection.InsertBefore ("【【")
    End If
Next

End Sub

Private Sub WfRestoreFirstLineIndent()
' 还原首行缩进

With ActiveDocument.Content.Find
    .Text = "【【([!^13]@)^13"
    .Replacement.Text = "\1^p"
    .Replacement.Style = ActiveDocument.Styles("正文_Indent2")
    .MatchWildcards = True
    .Wrap = wdFindContinue
    .Execute Replace:=wdReplaceAll
End With

End Sub

Private Sub WfRemoveEmptyBrackets()
' 移除空括号

With ActiveDocument.Content.Find
    .ClearFormatting
    .Replacement.ClearFormatting
    .Forward = True
    .Wrap = wdFindContinue
    .Format = False
    
    .Execute FindText:="[\(（][ 　^s]@[\)）]", ReplaceWith:="^p", MatchWildcards:=True, Replace:=wdReplaceAll
    .Execute FindText:="[\(（][\)）]", ReplaceWith:="^p", MatchWildcards:=True, Replace:=wdReplaceAll
End With

End Sub
Private Sub WfPictureLineSpaceSingle()
' 图片单倍行距

Dim oShp As InlineShape
For Each oShp In ActiveDocument.InlineShapes
    oShp.Select
    Selection.ParagraphFormat.LineSpacingRule = wdLineSpaceSingle
Next oShp

Dim oShape As shape
For Each oShape In ActiveDocument.Shapes
    oShape.Select
    Selection.ParagraphFormat.LineSpacingRule = wdLineSpaceSingle
Next oShape

End Sub

Private Function HasStyle(ByVal styleName As String) As Boolean
' 检查段落样式是否存在

Dim oStyle As Style
Dim has As Boolean

has = False
For Each oStyle In ActiveDocument.Styles
    If oStyle.NameLocal = styleName Then
        has = True
    End If
Next

HasStyle = has
End Function

Private Sub ApplyFontToTF()
' 给√×统一设定字体

Dim oRange As Range
For Each oRange In ActiveDocument.Characters
    If oRange.Text = "√" Or oRange.Text = "×" Then
        oRange.Font.Name = "Verdana"
        Selection.Font.Name = "Verdana"
    End If
Next

End Sub

Private Sub AdjustChoiceNo()
' 规范选择题编号 A. B. C. D.

Application.ScreenUpdating = False

With ActiveDocument.Content.Find
    .ClearFormatting
    .Replacement.ClearFormatting
    .Forward = True
    .Wrap = wdFindContinue
    
    ' A.
    ' B.
    ' C.
    ' D.
    .Execute FindText:="^13([A-D])[.．。][ 　]@([!^13]@)^13", ReplaceWith:="^p\1.\2^p", MatchWildcards:=True, Replace:=wdReplaceAll
    
    ' 因为查找表达式有长度限制，所以 ABCD 分成两次处理
    ' A. B. C.
    .Execute FindText:="^13A[.．。]([!^13]@)B[.．。]([!^13]@)C[.．。]([!^13]@)^13", ReplaceWith:="^pA. \1B. \2C. \3^p", MatchWildcards:=True, Replace:=wdReplaceAll
    ' D.
    .Execute FindText:="^13(A.[!^13]@)D[.．。]([!^13]@)^13", ReplaceWith:="^p\1D. \2^p", MatchWildcards:=True, Replace:=wdReplaceAll
    
    ' A. B. only
    .Execute FindText:="^13A[.．。]([!^13]@)B[.．。]([!^13]@)^13", ReplaceWith:="^pA. \1B. \2^p", MatchWildcards:=True, Replace:=wdReplaceAll
End With

Application.ScreenUpdating = True

End Sub

Private Sub WfAdjustPuncuation()
' 规范标点符号

Application.ScreenUpdating = False

With ActiveDocument.Content.Find
    .ClearFormatting
    .Replacement.ClearFormatting
    .Forward = True
    .Wrap = wdFindContinue
    
    ' 中文后面的标点为中文标点
    .Execute FindText:="([一-龥]),", ReplaceWith:="\1，", MatchWildcards:=True, Replace:=wdReplaceAll
    .Execute FindText:="([一-龥]).", ReplaceWith:="\1。", MatchWildcards:=True, Replace:=wdReplaceAll
    
    ' 图片前加空格
    .Execute FindText:="^g", ReplaceWith:=" ^&", MatchWildcards:=False, Replace:=wdReplaceAll
    
    
    ' 英文标点后确保有英文空格 (后跟非标点时)
    '
    ' ASCII Code:
    ' single straight quote ^039
    ' double straight quote ^034
    ' single curly quote ^0145 ^0146
    ' double straight right quote ^0147 ^0148
    .Execute FindText:="([.,\!:^039^034^0148])([a-zA-Z一-龥])", ReplaceWith:="\1 \2", MatchWildcards:=True, Replace:=wdReplaceAll
    
    ' 英文后跟英文左括号，需插入空格
    .Execute FindText:="([a-zA-Z])\(", ReplaceWith:="\1 (", MatchWildcards:=True, Replace:=wdReplaceAll
    
    ' 特例：Let's, What's
    .Execute FindText:="t’s([!a-z])", ReplaceWith:="t's\1", MatchWildcards:=True, Replace:=wdReplaceAll
    .Execute FindText:="t['’] s([!a-z])", ReplaceWith:="t's\1", MatchWildcards:=True, Replace:=wdReplaceAll
    .Execute FindText:="t ['’]s([!a-z])", ReplaceWith:="t's\1", MatchWildcards:=True, Replace:=wdReplaceAll
    .Execute FindText:="t ['’] s([!a-z])", ReplaceWith:="t's\1", MatchWildcards:=True, Replace:=wdReplaceAll
    
    ' 特例：I'd
    .Execute FindText:="’d([!a-z])", ReplaceWith:="'d\1", MatchWildcards:=True, Replace:=wdReplaceAll
    .Execute FindText:="['’] d([!a-z])", ReplaceWith:="'d\1", MatchWildcards:=True, Replace:=wdReplaceAll
    
    ' 特例：I'll
    .Execute FindText:="’ll([!a-z])", ReplaceWith:="'ll\1", MatchWildcards:=True, Replace:=wdReplaceAll
    .Execute FindText:="['’] ll([!a-z])", ReplaceWith:="'ll\1", MatchWildcards:=True, Replace:=wdReplaceAll
    
    ' 特例：We're
    .Execute FindText:="’re([!a-z])", ReplaceWith:="'re\1", MatchWildcards:=True, Replace:=wdReplaceAll
    .Execute FindText:="['’] re([!a-z])", ReplaceWith:="'re\1", MatchWildcards:=True, Replace:=wdReplaceAll
    
    ' 特例：don't, isn' t
    .Execute FindText:="n’t([!a-z])", ReplaceWith:="n't\1", MatchWildcards:=True, Replace:=wdReplaceAll
    .Execute FindText:="n['’] t([!a-z])", ReplaceWith:="n't\1", MatchWildcards:=True, Replace:=wdReplaceAll
    .Execute FindText:="n ['’]t([!a-z])", ReplaceWith:="n't\1", MatchWildcards:=True, Replace:=wdReplaceAll
    .Execute FindText:="n ['’] t([!a-z])", ReplaceWith:="n't\1", MatchWildcards:=True, Replace:=wdReplaceAll
    
    ' 特例：I'm
    .Execute FindText:="I’m", ReplaceWith:="I'm", MatchWildcards:=False, Replace:=wdReplaceAll
    .Execute FindText:="I['’] m", ReplaceWith:="I'm", MatchWildcards:=False, Replace:=wdReplaceAll
    .Execute FindText:="I ['’]m", ReplaceWith:="I'm", MatchWildcards:=False, Replace:=wdReplaceAll
    .Execute FindText:="I ['’] m", ReplaceWith:="I'm", MatchWildcards:=False, Replace:=wdReplaceAll

    ' 特例：o'clock
    .Execute FindText:="['’] clock", ReplaceWith:="'clock", MatchWildcards:=False, Replace:=wdReplaceAll
    
    ' 特例：Tian'anmen
    .Execute FindText:="Tian' anmen", ReplaceWith:="Tian'anmen", MatchWildcards:=False, Replace:=wdReplaceAll
    
    ' 英文右括号后跟英文，需插入空格
    .Execute FindText:="\)([a-zA-Z])", ReplaceWith:=") \1", MatchWildcards:=True, Replace:=wdReplaceAll
    
    ' _____ 前后有空格
    .Execute FindText:="_{1,}", ReplaceWith:=" ^& ", MatchWildcards:=True, Replace:=wdReplaceAll
    
    ' ____1____
    .Execute FindText:="_ {1,}([0-9]{1,2}) {1,}_", ReplaceWith:="_\1_", MatchWildcards:=True, Replace:=wdReplaceAll
    
    ' →
    .Execute FindText:=" {1,}→ {1,}", ReplaceWith:="→", MatchWildcards:=True, Replace:=wdReplaceAll
    
    ' —I'm Lilei.
    .Execute FindText:="— {1,}([a-zA-Z])", ReplaceWith:="—\1", MatchWildcards:=True, Replace:=wdReplaceAll
    
    ' 去除 ,.! 前的空格
    .Execute FindText:=" {1,}([,.\!])", ReplaceWith:="\1", MatchWildcards:=True, Replace:=wdReplaceAll
    
    ' 去除行尾空格
    .Execute FindText:="[　 ]{1,}^13", ReplaceWith:="^p", MatchWildcards:=True, Replace:=wdReplaceAll
End With

Application.ScreenUpdating = True

End Sub

Private Sub WfUniteQuestionNo()
' 统一题目编号

Application.ScreenUpdating = False

With ActiveDocument.Content.Find
    .ClearFormatting
    .Replacement.ClearFormatting
    .Forward = True
    .Wrap = wdFindContinue
    
    ' 一二三、
    .Execute FindText:="^13([一二三四五六七八九十])[、.．]", ReplaceWith:="^p\1、", MatchWildcards:=True, Replace:=wdReplaceAll
    
    ' 123456.
    .Execute FindText:="^13([0-9])[、.．]", ReplaceWith:="^p\1. ", MatchWildcards:=True, Replace:=wdReplaceAll
End With

' 按123456...顺序排列
Dim i As Integer
i = 1
With ActiveDocument.Content.Find
    .Text = "^13[0-9]{1,3}\."
    .Replacement.Text = ""
    .Forward = True
    .MatchWildcards = True
    .Execute
    
    Do While .Found = True
        If .Found = True Then
            .Execute FindText:="^13[0-9]{1,3}\.", MatchWildcards:=True, _
            ReplaceWith:="^p" & CStr(i) & ".", _
            Forward:=True, Replace:=wdReplaceOne
        End If
        .Execute
        
        i = i + 1
    Loop
End With

' 回到文档头
Selection.HomeKey Unit:=wdStory

' 参考答案与试题解析重新1起点
With Selection.Find
    .MatchWildcards = False
    .Text = "参考答案与试题解析"
    .Replacement.Text = ""
    .Execute
End With
Selection.Move
i = 1
With Selection.Find
    .Text = "^13[0-9]{1,3}\."
    .Replacement.Text = ""
    .Forward = True
    .MatchWildcards = True
    .Execute
    
    Do While .Found = True
        If .Found = True Then
            .Execute FindText:="^13[0-9]{1,3}\.", MatchWildcards:=True, _
            ReplaceWith:="^p" & CStr(i) & ".", _
            Forward:=True, Replace:=wdReplaceOne
        End If
        .Execute
        
        i = i + 1
    Loop
End With

' 规范 (1)
With ActiveDocument.Content.Find
    .Text = "^13[\(（]([0-9]{1,})[\)）]"
    .Replacement.Text = "^p(\1) "
    .Wrap = wdFindContinue
    .MatchWildcards = True
    .Execute Replace:=wdReplaceAll
End With

Application.ScreenUpdating = True

End Sub

