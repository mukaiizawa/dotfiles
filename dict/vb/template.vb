Option Explicit

Sub main()
  Application.ScreenUpdating = False
  Application.DisplayAlerts = False
  Debug.Print "hello world"
  Application.DisplayAlerts = True
  Application.ScreenUpdating = True
End Sub
