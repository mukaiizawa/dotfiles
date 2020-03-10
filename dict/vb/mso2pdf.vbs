' Microsoft Office to PDF

Option Explicit

'option
Dim isRecursive

' global variable
Dim fso
Dim word
Dim excel
Dim ppt

Sub Usage()
  Xprint("Usage: cscript mso2pdf.vbs [OPTION]")
  Xprint("OPTION")
  Xprint("  -r execute recursively")
  Xprint("")
  Xprint("Create a PDF file from Microsoft Office.")
  Xprint("")
  Xprint("Support file type")
  Xprint("  xlsx, xls, docx, doc, pptx, ppt")
End Sub

Sub Xprint(msg)
  WScript.StdOut.Write(msg & vbCrLf)
End Sub

Sub Xerror(msg)
  WScript.StdErr.Write(msg & vbCrLf)
End Sub

Function toPDFPath (file)
  Dim pdf
  pdf = Left(file, Len(file) - Len(fso.GetExtensionName(file))) & "pdf"
  If fso.FileExists(pdf) Then
    Xprint("remove:" & pdf)
    Call fso.DeleteFile(pdf)
  End If
  toPDFPath = pdf
End Function

Sub WordToPDF(file)
  On Error Resume Next
  Dim f
  Set f = word.Documents.Open(file.path, , True)
  Call word.ActiveDocument.ExportAsFixedFormat(toPDFPath(file), 17, False)
  Call f.Close(.0)
  If Err.Number > 0 Then
    Xerror("failed:" & file.name)
    Err.Clear
  End If
End Sub

Sub ExcelToPDF(file)
  On Error Resume Next
  Dim f
  Set f = excel.Workbooks.Open(file.path)
  Call f.ExportAsFixedFormat(0, toPDFPath(file), 0)
  Call f.Close(False)
  If Err.Number > 0 Then
    Xerror("failed:" & file.name)
    Err.Clear
  End If
End Sub

Sub PowerPointToPDF(file)
  On Error Resume Next
  Dim f
  Set f = ppt.Presentations.Open(file.path, True, False, False)
  Call f.SaveAs(toPDFPath(file), 32, False)
  Call f.Close
  If Err.Number > 0 Then
    Xerror("failed:" & file.name)
    Err.Clear
  End If
End Sub

Sub toPDF(folder)
  Dim file
  For Each file In folder.files
    If (file.Attributes And 2) = 0 Then
      Select Case LCase(fso.GetExtensionName(file.path))
        Case "docx", "doc"
          Xprint("start:" & file.path)
          Call WordToPDF(file)
        Case "xlsx", "xls"
          Xprint("start:" & file.path)
          Call ExcelToPDF(file)
        Case "pptx", "ppt"
          Xprint("start:" & file.path)
          Call PowerPointToPDF(file)
        Case Else
          Xprint("skip:" & file.path)
      End Select
    End If
  Next 
  If isRecursive Then
    For Each file In folder.subfolders
      Call toPDF(file)
    Next
  End If
End Sub

Sub ParseArgs()
  isRecursive = False
  If WScript.Arguments.Count = 0 Then
    EXIT Sub
  End If
  If WScript.Arguments.Count = 1 Then
    If StrComp(WScript.Arguments.Item(0) , "-r") = 0 Then
      isRecursive = True
      EXIT Sub
    End If
  End If
  Xerror("Illegal arguments")
  Call Usage()
  WScript.Quit(1)
End Sub

Sub Init()
  Set fso = CreateObject("Scripting.FileSystemObject")
  Set word = CreateObject("Word.Application")
  Set excel = CreateObject("Excel.Application")
  Set ppt = CreateObject("PowerPoint.Application")
End Sub

Sub Finalize()
  word.Quit
  excel.Quit
  ppt.Quit
End Sub

Sub Main()
  Call Init()
  Call ParseArgs()
  Call toPDF(fso.GetFolder("."))
  Call Finalize()
End Sub

Call Main
