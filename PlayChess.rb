require_relative 'ChessValidator'

board=Board.new('board.txt')
board.movement("f2","f4")
board.movement("f6","f4")
board.movement("a2","a3")
board.movement("b2","b4")
board.movement("c2","c6")
board.movement("b2","b1")
board.movement("a7","a5")
board.movement("b7","b4")
board.movement("c7","c6")
board.movement("g1","d5")
