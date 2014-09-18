require_relative 'ChessValidator'

tablero=Board.new('board.txt')
tablero.movement("f2","f4")
tablero.movement("f6","f4")
tablero.movement("a2","a3")
tablero.movement("b2","b4")
tablero.movement("c2","c6")
tablero.movement("b2","b1")
tablero.movement("a7","a5")
tablero.movement("b7","b4")
tablero.movement("c7","c6")
tablero.movement("g1","d5")
