' number place

Option Explicit

Dim BOARD_SIZE As Integer
Dim EXIT_FLG As Integer

Sub main()
  EXIT_FLG = 0
  BOARD_SIZE = 9
  Dim board() As Integer
  board = mkboard(BOARD_SIZE, BOARD_SIZE)
  Call try_put_number(board, 1, 1)
End Sub

Function mkboard(x As Integer, y As Integer) As Integer()
  Dim board() As Integer
  Dim i As Integer
  Dim j As Integer
  ReDim board(1 To x, 1 To y)
  For i = 1 To x
    For j = 1 To y
      board(i, j) = -1
    Next
  Next
  mkboard = board
End Function

Sub try_put_number(board() As Integer, row As Integer, col As Integer)
  If EXIT_FLG = 1 Then
    Exit Sub
  ElseIf row > BOARD_SIZE Then
    EXIT_FLG = 1
    Call print_board(board, 2, 2)
    MsgBox "finish"
  Else
    Dim i As Integer
    Dim num As Integer
    Dim rand_arr() As Integer
    rand_arr = get_rand_arr(BOARD_SIZE)
    For i = 1 To BOARD_SIZE
      num = rand_arr(i)
      If canput(board, row, col, num) Then
        If col = BOARD_SIZE Then
          Call try_put_number(put_number(board, row, col, num), row + 1, 1)
        Else
          Call try_put_number(put_number(board, row, col, num), row, col + 1)
        End If
      End If
    Next
  End If
End Sub

Function put_number(board() As Integer, row As Integer, col As Integer, num As Integer) As Integer()
  Dim new_board() As Integer
  Dim i As Integer
  Dim j As Integer
  ReDim new_board(1 To BOARD_SIZE, 1 To BOARD_SIZE)
  For i = 1 To BOARD_SIZE
    For j = 1 To BOARD_SIZE
      If i = row And j = col Then
        new_board(i, j) = num
      Else
        new_board(i, j) = board(i, j)
      End If
    Next
  Next
  put_number = new_board
End Function

Function get_rand_arr(length As Integer) As Integer()
  Dim i As Integer
  Dim rand_arr() As Integer
  ReDim rand_arr(1 To length)
  For i = 1 To length
    rand_arr(i) = i
  Next
  ' shuffle
  Dim rand As Integer
  Dim temp As Integer
  For i = 1 To length
    Randomize
    rand = Int(length * Rnd + 1)
    temp = rand_arr(i)
    rand_arr(i) = rand_arr(rand)
    rand_arr(rand) = temp
  Next
  get_rand_arr = rand_arr
End Function

Function canput(board() As Integer, row As Integer, col As Integer, num As Integer) As Boolean
  Dim i As Integer
  Dim j As Integer
  Dim flg As Boolean
  flg = True
  ' check row and col
  For i = 1 To BOARD_SIZE
    If board(row, i) = num Or board(i, col) = num Then
      flg = False
    End If
  Next
  'check box: 3 * 3
  Dim row_offset As Integer
  Dim col_offset As Integer
  row_offset = row - ((row - 1) Mod 3)
  col_offset = col - ((col - 1) Mod 3)
  For i = row_offset To row_offset + 2
    For j = col_offset To col_offset + 2
      If board(i, j) = num Then
        flg = False
      End If
    Next
  Next
  canput = flg
End Function

Sub print_board(board() As Integer, row As Integer, col As Integer)
  Dim i As Integer
  Dim j As Integer
  For i = 1 To BOARD_SIZE
    For j = 1 To BOARD_SIZE
      Cells(i + row - 1, j + col - 1).Value = board(i, j)
    Next
  Next
End Sub

