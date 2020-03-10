' Microsoft Office to PDF
'
' Usage: cscript mso2pdf.vbs

Option Explicit

Dim fso
Dim word
Dim excel
Dim ppt

Sub Xprint(msg)
  WScript.StdOut.Write(msg & vbCrLf)
End Sub

Sub Xerror(msg)
  WScript.StdErr.Write("error:" & msg & vbCrLf)
End Sub

Function toPDFPath (file)
  Dim pdf
  pdf = Left(file, Len(file) - Len(fso.GetExtensionName(file))) & "pdf"
  If fso.FileExists(pdf) Then
    On Error Resume Next
    Xprint("remove '" & pdf & "'")
    Call fso.DeleteFile(pdf)
    If Err.Number > 0 Then
      Xerror("could not delete already existed pdf file '" & pdf & "'")
      Err.Clear
    End If
    On Error GoTo 0
  End If
  toPDFPath = pdf
End Function

Sub WordToPDF(file)
  Dim f
  Set f = word.Documents.Open(file.path, , True)
  Call word.ActiveDocument.ExportAsFixedFormat(toPDFPath(file), _
    17, False)
End Sub

Sub ExcelToPDF(file)
  Dim f
  Set f = excel.Workbooks.Open(file.path)
  Call f.ExportAsFixedFormat(0, toPDFPath(file), 0)
End Sub

Sub PowerPointToPDF(file)
  Dim f
  Set f = ppt.Presentations.Open(file.path, True, False, False)
  Call f.SaveAs(toPDFPath(file), 32, False)
End Sub

Sub toPDF(folder, isRecur)
  Dim file
  For Each file In folder.files
    Select Case LCase(fso.GetExtensionName(file.path))
      Case "docx", "doc"
        Xprint("start:" & file.path)
        Call WordToPDF(file)
      Case "xlsx", "xls"
        Xprint("start:" & file.path)
        Call ExcelToPDF(file)
      Case "ppt", "xls"
        Xprint("start:" & file.path)
        Call ExcelToPDF(file)
      Case Else
        Xprint("skip:" & file.path)
    End Select
  Next 
  If isRecur Then
    For Each file In folder.subfolders
      Call toPDF(file, True)
    Next
  End If
End Sub

Sub Init()
  Set fso = CreateObject("Scripting.FileSystemObject")
  Set word = CreateObject("Word.Application")
  Set excel = CreateObject("Excel.Application")
  Set ppt = CreateObject("PowerPoint.Application")
End Sub

Sub Main()
  Call Init()
  Xprint("start")
  Call toPDF(fso.GetFolder("."), False)
  Xprint("finished")
End Sub

Call Main
