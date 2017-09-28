' nqueen problem

Option Explicit

Dim BOARD_SIZE As Integer
Dim PRINT_POINTER As Integer

Sub main()
  BOARD_SIZE = 8
  PRINT_POINTER = 2
  Dim board() As Integer
  board = mkboard(BOARD_SIZE, BOARD_SIZE)
  Call try_put_queen(board, 1)
End Sub

Function mkboard(x As Integer, y As Integer) As Integer()
  Dim board() As Integer
  Dim i As Integer
  Dim j As Integer
  ReDim board(1 To x, 1 To y)
  For i = 1 To x
    For j = 1 To y
      board(i, j) = 0
    Next
  Next
  mkboard = board
End Function

' try put queen at line n
Sub try_put_queen(board() As Integer, row As Integer)
  If row > BOARD_SIZE Then
    Call print_board(board, PRINT_POINTER, 2)
    PRINT_POINTER = PRINT_POINTER + BOARD_SIZE + 2
  Else
    Dim col As Integer
    For col = 1 To BOARD_SIZE
      If canput(board, row, col) Then
        Call try_put_queen(put_queen(board, row, col), row + 1)
      End If
    Next
  End If
End Sub

Function put_queen(board() As Integer, row As Integer, col As Integer) As Integer()
  Dim new_board() As Integer
  Dim i As Integer
  Dim j As Integer
  ReDim new_board(1 To BOARD_SIZE, 1 To BOARD_SIZE)
  For i = 1 To BOARD_SIZE
    For j = 1 To BOARD_SIZE
      If i = row And j = col Then
        new_board(i, j) = 1
      Else
        new_board(i, j) = board(i, j)
      End If
    Next
  Next
  put_queen = new_board
End Function

Function canput(board() As Integer, row As Integer, col As Integer) As Boolean
  Dim i As Integer
  Dim j As Integer
  Dim flg As Boolean
  flg = True
  ' check row and col
  For i = 1 To BOARD_SIZE
    If board(row, i) = 1 Or board(i, col) = 1 Then
      flg = False
    End If
  Next
  ' top-rihgt
  i = row
  j = col
  do while is_in_board(i - 1, j + 1)
    i = i - 1
    j = j + 1
    If board(i, j) = 1 Then
      flg = False
    End If
  loop
  ' top-left
  i = row
  j = col
  do while is_in_board(i - 1, j - 1)
    i = i - 1
    j = j - 1
    If board(i, j) = 1 Then
      flg = False
    End If
  loop
  canput = flg
End Function

Function is_in_board(row As Integer, col As Integer) As Boolean
  is_in_board = (0 < row) And (row < BOARD_SIZE + 1) And (0 < col) And (col < BOARD_SIZE + 1)
End Function

Sub print_board(board() As Integer, row As Integer, col As Integer)
  Dim i As Integer
  Dim j As Integer
  For i = 1 To BOARD_SIZE
    For j = 1 To BOARD_SIZE
      Cells(i + row - 1, j + col - 1).Value = iif(board(i, j)=1, "Q", "")
    Next
  Next
End Sub

