VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} frmEnDocF 
   Caption         =   "Ӣ���Ծ������� v2.0"
   ClientHeight    =   7410
   ClientLeft      =   20595
   ClientTop       =   6465
   ClientWidth     =   11760
   OleObjectBlob   =   "frmEnDocF.frx":0000
   ShowModal       =   0   'False
   StartUpPosition =   1  '����������
End
Attribute VB_Name = "frmEnDocF"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub btnAdjustDocFormat_Click()
' �淶�ĵ���ʽ

WfAdjustDocFormat
End Sub

Private Sub btnInsertChoiceLine_Click()
' ����ѡ�������

Selection.TypeText Text:="________"
End Sub

Private Sub btnInsertCompositionLines_Click()
' �������ĺ���

Dim line, lines As String
Dim i, j As Integer

' һ��60��_
line = ""
For i = 1 To 60
    line = line & "_"
Next i

' ��7��
lines = ""
For i = 1 To 7
    lines = lines & vbCrLf & line
Next i

Selection.TypeText lines
End Sub

Private Sub btnInsertContinuousNo_Click()
'�����������

Selection.TypeText Text:="___n___"
End Sub

Private Sub btnInsertFillInBlanksLine_Click()
' ������պ���

Selection.TypeText Text:="_____________"
End Sub

Private Sub btnInsertDialogPrefix_Click()
' ����Ի�����

Selection.TypeText Text:="��"
End Sub

Private Sub btnInsertChoiceAnalysisTemplate_Click()
' �������ͽ���ģ�壺ѡ����

Selection.TypeText AnalysisTemplate("CHOICE")
End Sub

Private Sub btnInsertFillInBlanksAnalysisTemplate_Click()
' �������ͽ���ģ�壺�����

Selection.TypeText AnalysisTemplate("FILL_IN_BLANKS")
End Sub

Private Sub btnInsertComprehensiveAnalysisTemplate_Click()
' �������ͽ���ģ�壺�ۺ���

Selection.TypeText AnalysisTemplate("COMPREHENSIVE")
End Sub

Private Sub btnInsertCompositionAnalysisTemplate_Click()
'�������ͽ���ģ�壺����

Selection.TypeText AnalysisTemplate("COMPOSITION")
End Sub

Private Function AnalysisTemplate(ByVal questionType As String) As String
'���ͽ���ģ��

Dim str As String
str = ""

Select Case questionType
    Case "CHOICE"
        str = "n." & vbCrLf & "�����" & vbCrLf & "��ѡ��" & vbCrLf
    Case "FILL_IN_BLANKS"
        str = "n." & vbCrLf & "�����" & vbCrLf & "�ʴ�Ϊ��" & vbCrLf
    Case "COMPREHENSIVE"
        str = "n." & vbCrLf & "�����(1)�ʴ�Ϊ��" & vbCrLf _
        & "(2)�ʴ�Ϊ��" & vbCrLf _
        & "(3)�ʴ�Ϊ��" & vbCrLf _
        & "(4)�ʴ�Ϊ��" & vbCrLf _
        & "(5)�ʴ�Ϊ��" & vbCrLf
    Case "COMPOSITION"
        str = "n." & vbCrLf & "�����One possible version:" & vbCrLf
    Case Else
        str = ""
End Select

AnalysisTemplate = str
End Function

Private Sub WfAdjustDocFormat()
' �ĵ���ʽ����

If HasStyle("����") = False Then
    MsgBox ("���顰���ġ���ʽ�Ƿ���ڣ�")
    Exit Sub
End If

Application.ScreenUpdating = False

' �滻ǰ��׼������
PrepareForReplace

' ���п��б�� ==
WfMarkBlankLine

' ˫�����ǣ��������¶�����ʽ���滻ʱ����
With Selection.Find
    .MatchWildcards = False
    .Text = "^p{1,}"
    .Replacement.Text = "^p^p"
    .Wrap = wdFindContinue
    .Execute Replace:=wdReplaceAll
End With

' �������������Ķ���ӱ�ǡ���
WfMarkFirstLineIndent

' ���������ġ���ʽ
WfAdjustBodyStyle

' ȫ��Ӧ�á����ġ���ʽ
ApplyBodyStyle

' ��ԭ��������
WfRestoreFirstLineIndent

' �Ƴ�������
WfRemoveEmptyBrackets

' ���̡�ͳһ�趨����
ApplyFontToTF

' �淶ѡ������ A. B. C. D.
AdjustChoiceNo

' �淶������
WfAdjustPuncuation

' ͳһ��Ŀ���
WfUniteQuestionNo

' ͼƬ�����о�
WfPictureLineSpaceSingle

' ��β���Ƴ�����Ҫ�Ŀո񡢶����ǵ�
RemovePrepareRedundance

' ��ԭ����
WfRestoreBlankLine

Application.ScreenUpdating = True

MsgBox "�ĵ���ʽ���� DONE!"

End Sub

Private Sub PrepareForReplace()
' �滻ǰ��׼������

Application.ScreenUpdating = False

With ActiveDocument.Content.Find
    .ClearFormatting
    .Replacement.ClearFormatting
    .Forward = True
    .Wrap = wdFindContinue
    
    ' ����Ͽո��滻ΪӢ�Ŀո�
    .Execute FindText:="^s", ReplaceWith:=" ", MatchWildcards:=True, Replace:=wdReplaceAll
    
    ' �Ƴ����׿ո�
    .Execute FindText:="^13[ ��]{1,}", ReplaceWith:="^p", MatchWildcards:=True, Replace:=wdReplaceAll
End With

Application.ScreenUpdating = True

End Sub

Private Sub RemovePrepareRedundance()
' ��β���Ƴ�����Ҫ�Ŀո񡢶����ǵ�

Application.ScreenUpdating = False

With ActiveDocument.Content.Find
    .ClearFormatting
    .Replacement.ClearFormatting
    .Forward = True
    .Wrap = wdFindContinue
    
    ' �Ƴ����������
    .Execute FindText:="^13{2,}", ReplaceWith:="^p", MatchWildcards:=True, Replace:=wdReplaceAll
    
    ' �Ƴ�����ո�
    .Execute FindText:=" {2,}", ReplaceWith:=" ", MatchWildcards:=True, Replace:=wdReplaceAll
    
    ' �Ƴ����׿ո�
    .Execute FindText:="^13[ ��]{1,}", ReplaceWith:="^p", MatchWildcards:=True, Replace:=wdReplaceAll
    
    ' �Ƴ���β�ո�
    .Execute FindText:="[ ��]{1,}^13", ReplaceWith:="^p", MatchWildcards:=True, Replace:=wdReplaceAll
    
    ' �������ġ���
    .Execute FindText:="����", ReplaceWith:="", MatchWildcards:=False, Replace:=wdReplaceAll
End With

Application.ScreenUpdating = True

End Sub

Private Sub WfAdjustBodyStyle()
' ���������ġ���ʽ

Dim oDoc As Document
Set oDoc = ActiveDocument
Dim oStyle As Style

With oDoc.Styles("����").Font
    .NameFarEast = "˼Դ���� Regular"
    .NameAscii = "Verdana"
    .NameOther = "Verdana"
    .Name = "Verdana"
    .Size = 10
    .Color = wdColorBlack
End With

With oDoc.Styles("����").ParagraphFormat
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

If Not HasStyle("����_����2�ַ�") Then
    Set oStyle = oDoc.Styles.Add("����_����2�ַ�")
    oStyle.BaseStyle = oDoc.Styles("����")
    oStyle.ParagraphFormat.CharacterUnitFirstLineIndent = 2
End If

End Sub

Private Sub ApplyBodyStyle()
' ȫ��Ӧ�á����ġ���ʽ

Selection.WholeStory
Selection.ClearFormatting
Selection.Style = ActiveDocument.Styles("����")
End Sub

Private Sub WfMarkBlankLine()
' ���п��б�� ==

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
' ��ԭ����

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
' �������������Ķ���ӱ�ǡ���

Dim oPara As Paragraph
For Each oPara In ActiveDocument.Paragraphs
    If oPara.Format.FirstLineIndent > 0 Then
        oPara.Range.Select
        Selection.InsertBefore ("����")
    End If
Next

End Sub

Private Sub WfRestoreFirstLineIndent()
' ��ԭ��������

With ActiveDocument.Content.Find
    .Text = "����([!^13]@)^13"
    .Replacement.Text = "\1^p"
    .Replacement.Style = ActiveDocument.Styles("����_����2�ַ�")
    .MatchWildcards = True
    .Wrap = wdFindContinue
    .Execute Replace:=wdReplaceAll
End With

End Sub

Private Sub WfRemoveEmptyBrackets()
' �Ƴ�������

With ActiveDocument.Content.Find
    .ClearFormatting
    .Replacement.ClearFormatting
    .Forward = True
    .Wrap = wdFindContinue
    .Format = False
    
    .Execute FindText:="[\(��][ ��^s]@[\)��]", ReplaceWith:="^p", MatchWildcards:=True, Replace:=wdReplaceAll
    .Execute FindText:="[\(��][\)��]", ReplaceWith:="^p", MatchWildcards:=True, Replace:=wdReplaceAll
End With

End Sub
Private Sub WfPictureLineSpaceSingle()
' ͼƬ�����о�

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
' ��������ʽ�Ƿ����

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
' ���̡�ͳһ�趨����

Dim oRange As Range
For Each oRange In ActiveDocument.Characters
    If oRange.Text = "��" Or oRange.Text = "��" Then
        oRange.Font.Name = "Verdana"
        Selection.Font.Name = "Verdana"
    End If
Next

End Sub

Private Sub AdjustChoiceNo()
' �淶ѡ������ A. B. C. D.

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
    .Execute FindText:="^13([A-D])[.����][ ��]@([!^13]@)^13", ReplaceWith:="^p\1.\2^p", MatchWildcards:=True, Replace:=wdReplaceAll
    
    ' A. B. C.
    .Execute FindText:="^13A[.����]([!^13]@)B[.����]([!^13]@)C[.����]([!^13]@)^13", ReplaceWith:="^pA. \1B. \2C. \3^p", MatchWildcards:=True, Replace:=wdReplaceAll
    
    ' D.
    .Execute FindText:="^13(A.[!^13]@)D[.����]([!^13]@)^13", ReplaceWith:="^p\1D. \2^p", MatchWildcards:=True, Replace:=wdReplaceAll
    
    ' A. B. only
    .Execute FindText:="^13A[.����]([!^13]@)B[.����]([!^13]@)^13", ReplaceWith:="^pA. \1B. \2^p", MatchWildcards:=True, Replace:=wdReplaceAll
End With

Application.ScreenUpdating = True

End Sub

Private Sub WfAdjustPuncuation()
' �淶������

Application.ScreenUpdating = False

With ActiveDocument.Content.Find
    .ClearFormatting
    .Replacement.ClearFormatting
    .Forward = True
    .Wrap = wdFindContinue
    
    ' ���ĺ���ı��Ϊ���ı��
    .Execute FindText:="([һ-��]),", ReplaceWith:="\1��", MatchWildcards:=True, Replace:=wdReplaceAll
    .Execute FindText:="([һ-��]).", ReplaceWith:="\1��", MatchWildcards:=True, Replace:=wdReplaceAll
    
    ' ͼƬǰ�ӿո�
    .Execute FindText:="^g", ReplaceWith:=" ^&", MatchWildcards:=False, Replace:=wdReplaceAll
    
    
    ' Ӣ�ı���ȷ����Ӣ�Ŀո� (����Ǳ��ʱ)
    '
    ' ASCII Code:
    ' single straight quote ^039
    ' double straight quote ^034
    ' single curly quote ^0145 ^0146
    ' double straight right quote ^0147 ^0148
    .Execute FindText:="([.,\!:^039^034^0148])([a-zA-Zһ-��])", ReplaceWith:="\1 \2", MatchWildcards:=True, Replace:=wdReplaceAll
    
    ' Ӣ�ĺ��Ӣ�������ţ������ո�
    .Execute FindText:="([a-zA-Z])\(", ReplaceWith:="\1 (", MatchWildcards:=True, Replace:=wdReplaceAll
    
    ' ������Let's, What's
    .Execute FindText:="t' s([!a-z])", ReplaceWith:="t's\1", MatchWildcards:=True, Replace:=wdReplaceAll
    .Execute FindText:="t 's([!a-z])", ReplaceWith:="t's\1", MatchWildcards:=True, Replace:=wdReplaceAll
    .Execute FindText:="t ' s([!a-z])", ReplaceWith:="t's\1", MatchWildcards:=True, Replace:=wdReplaceAll
    
    ' ������I'd
    .Execute FindText:="' d([!a-z])", ReplaceWith:="'d\1", MatchWildcards:=True, Replace:=wdReplaceAll
    
    ' ������I'll
    .Execute FindText:="' ll([!a-z])", ReplaceWith:="'ll\1", MatchWildcards:=True, Replace:=wdReplaceAll
    
    ' ������We're
    .Execute FindText:="' re([!a-z])", ReplaceWith:="'re\1", MatchWildcards:=True, Replace:=wdReplaceAll
    
    ' ������don't, isn' t
    .Execute FindText:="n' t([!a-z])", ReplaceWith:="n't\1", MatchWildcards:=True, Replace:=wdReplaceAll
    .Execute FindText:="n 't([!a-z])", ReplaceWith:="n't\1", MatchWildcards:=True, Replace:=wdReplaceAll
    .Execute FindText:="n ' t([!a-z])", ReplaceWith:="n't\1", MatchWildcards:=True, Replace:=wdReplaceAll
    
    ' ������I'm
    .Execute FindText:="I' m", ReplaceWith:="I'm", MatchWildcards:=False, Replace:=wdReplaceAll
    .Execute FindText:="I 'm", ReplaceWith:="I'm", MatchWildcards:=False, Replace:=wdReplaceAll
    .Execute FindText:="I ' m", ReplaceWith:="I'm", MatchWildcards:=False, Replace:=wdReplaceAll

    ' ������o'clock
    .Execute FindText:="' clock", ReplaceWith:="'clock", MatchWildcards:=False, Replace:=wdReplaceAll
    
    ' ������Tian'anmen
    .Execute FindText:="Tian' anmen", ReplaceWith:="Tian'anmen", MatchWildcards:=False, Replace:=wdReplaceAll
    
    ' Ӣ�������ź��Ӣ�ģ������ո�
    .Execute FindText:="\)([a-zA-Z])", ReplaceWith:=") \1", MatchWildcards:=True, Replace:=wdReplaceAll
    
    ' _____ ǰ���пո�
    .Execute FindText:="_{1,}", ReplaceWith:=" ^& ", MatchWildcards:=True, Replace:=wdReplaceAll
    
    ' ____1____
    .Execute FindText:="_ {1,}([0-9]{1,2}) {1,}_", ReplaceWith:="_\1_", MatchWildcards:=True, Replace:=wdReplaceAll
    
    ' ��
    .Execute FindText:=" {1,}�� {1,}", ReplaceWith:="��", MatchWildcards:=True, Replace:=wdReplaceAll
    
    ' ��I'm Lilei.
    .Execute FindText:="�� {1,}([a-zA-Z])", ReplaceWith:="��\1", MatchWildcards:=True, Replace:=wdReplaceAll
    
    ' ȥ�� ,.! ǰ�Ŀո�
    .Execute FindText:=" {1,}([,.\!])", ReplaceWith:="\1", MatchWildcards:=True, Replace:=wdReplaceAll
    
    ' ȥ����β�ո�
    .Execute FindText:="[�� ]{1,}^13", ReplaceWith:="^p", MatchWildcards:=True, Replace:=wdReplaceAll
End With

Application.ScreenUpdating = True

End Sub

Private Sub WfUniteQuestionNo()
' ͳһ��Ŀ���

Application.ScreenUpdating = False

With ActiveDocument.Content.Find
    .ClearFormatting
    .Replacement.ClearFormatting
    .Forward = True
    .Wrap = wdFindContinue
    
    ' һ������
    .Execute FindText:="^13([һ�����������߰˾�ʮ])[��.��]", ReplaceWith:="^p\1��", MatchWildcards:=True, Replace:=wdReplaceAll
    
    ' 123456.
    .Execute FindText:="^13([0-9])[��.��]", ReplaceWith:="^p\1. ", MatchWildcards:=True, Replace:=wdReplaceAll
End With

' ��123456...˳������
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

' �ص��ĵ�ͷ
Selection.HomeKey Unit:=wdStory

' �ο����������������1���
With Selection.Find
    .MatchWildcards = False
    .Text = "�ο������������"
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

' �淶 (1)
With Selection.Find
    .Text = "^13[\(��]([0-9]{1,})[\)��]"
    .Replacement.Text = "^p(\1) "
    .Wrap = wdFindContinue
    .MatchWildcards = True
    .Execute Replace:=wdReplaceAll
End With

End Sub


