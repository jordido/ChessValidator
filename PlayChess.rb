require_relative 'ChessValidator'

tablero=Board.new('board.txt')
tablero.movement("a1","b1")
tablero.movement("f5","h6")
tablero.movement("b3","b1")
tablero.movement("d2","b1")
tablero.movement("d7","b1")
