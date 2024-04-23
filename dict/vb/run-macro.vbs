Option Explicit

Sub Usage()
  WScript.StdErr.Write("Usage: cscript run-macro.vbs PATH [MACRO]" & vbCrLf)
  WScript.StdErr.Write("Running excel macros." & vbCrLf)
End Sub

Sub RunMacro(file, macro)
  Dim excel, book
  Set excel = CreateObject("Excel.application")
  WScript.StdOut.Write("Open " & file & vbCrLf)
  Set book = excel.Workbooks.Open(file, 0, False)    ' writable
  excel.Application.Visible = True
  excel.DisplayAlerts = False
  excel.Application.run macro
  excel.ActiveWindow.Close(True)    ' save
  excel.Quit
  WScript.StdOut.Write("Close " & file & vbCrLf)
End Sub 

Sub Main()
  Dim path, macro
  If WScript.Arguments.Count = 0 Then
    Call Usage()
    EXIT Sub
  End If
  path = CreateObject("Scripting.FileSystemObject").GetAbsolutePathName(WScript.Arguments.Item(0))
  If WScript.Arguments.Count = 2 Then
    macro = "ThisWorkbook." & WScript.Arguments.Item(1)
  Else
    macro = "ThisWorkbook.main"
  End If
  Call RunMacro(path, macro)
End Sub

Call Main()
