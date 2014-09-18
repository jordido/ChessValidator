require 'pry'

class Board
	def initialize(file)
		#@board=Array.new(8) { Array.new(8) }
		@board = []
		File.open(file) do |f|
  			f.lines.each do |line|
    		@board << line.split(" ").map(&:to_s)
    		end
    	end
    	@board.reverse!
    	puts @board.inspect
    	@col_convers = {:a => 0, :b =>1, :c => 2, :d => 3, :e => 4, :f => 5, :g => 6, :h => 7}
  	end


	def content (row,column)
		return @board[row][column]
	end

	def color (coordenades)
		row = coordenades[0]
		column = coordenades[1]
		return @board[row][column][0]

	end

	def piece_type (coordenades)  # coordenades en format array numèric
		row = coordenades[0]
		column = coordenades[1]
		return @board[row][column][1]
	end


	def movement (origin, destiny)  # coordenades en format original a1, b1, etc
		new_origin = []
		new_destiny = []
		new_origin [1] = @col_convers[origin[0]].to_i
		new_origin [0] = origin[1].to_i - 1 
		new_destiny [1] = @col_convers[destiny[0]].to_i
		new_destiny [0] = destiny[1].to_i - 1 
		color = color(new_origin)
		piece = piece_type(new_origin)
		P.move(new_origin, new_destiny, @board)
		R.move(new_origin, new_destiny, @board)
	end
end




class Piece
	def initialize
		@row = 0
		@column = 0
	end
	def row
	end
	def column
	end
end

class P < Piece
	def initialize (color)
	end
	def move (origin,destiny,board)  # a2 -> a3 
		




	end
end


class R < Piece
	def initialize (color)
	end
	def move (origin,destiny)  # a2 -> a3 
	end
end

class N < Piece
	def initialize (color)
	end
	def move (origin,destiny)  # a2 -> a3 
	end
end

class B < Piece
	def initialize (color)
	end
	def move (origin,destiny)  # a2 -> a3 
	end
end

class Q < Piece
	def initialize (color)
	end
	def move (origin,destiny)  # a2 -> a3 
	end
end

class K	< Piece
	def initialize (color)
	end
	def move (origin,destiny)  # a2 -> a3 
	end
end

