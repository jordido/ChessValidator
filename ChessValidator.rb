require 'pry'

class Board
	def initialize(file)
		@board = []
		File.open(file) do |f|
			f.each_line do |line|
				@board << line.split(" ").map{|x| x.to_s}
			end
		end
		@board.reverse!
		@col_convers = {"a" => 0, "b" =>1, "c" => 2, "d" => 3, "e" => 4, "f" => 5, "g" => 6, "h" => 7}
	end


	def content (coordenades)
		row = coordenades[0]
		column = coordenades[1]
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

		piece = piece_type(new_origin)
		print piece + " "
		print origin + " " + new_origin.inspect + " -> " + destiny + " " + new_destiny.inspect + ": "
		if piece != "-"
			puts Object.const_get(piece).new.move(new_origin, new_destiny, self)
		else
			puts "ILEGAL"
		end
	end
end




class Piece
	def initialize
		@row = 0
		@column = 0
	end
	def freeway (origin,destiny,board)
		row_origin = origin[0]
		col_origin = origin[1]
		row_destiny = destiny[0]
		col_destiny = destiny[1]

		(row_origin...row_destiny).each do |row|
			(col_origin...col_destiny).each do |col|
				if board.content([row,col]) != "--"
					return false
				end
			end
		end
		return true
	end
	def row
	end
	def column
	end
end

class P < Piece
	def initialize
	end
	def move (origin,destiny,board)  # a2 -> a3
		row_origin = origin[0]
		col_origin = origin[1]
		row_destiny = destiny[0]
		col_destiny = destiny[1]
		puts freeway(origin,destiny,board)
		if board.color(origin) == "-"
			puts "Error color empty origin"
		elsif board.color(origin) == "w"
			return "ILEGAL" if row_destiny - row_origin > 2
			return "ILEGAL" if col_destiny != col_origin
			return "ILEGAL" if board.content(destiny) != "--"
			if (row_destiny - row_origin > 1) && (row_origin != 1)
				return "ILEGAL"
			end
			if board.content(destiny) != "--"
				return "ILEGAL"
			end
			return "LEGAL"

		elsif board.color(origin) == "b"
			return "ILEGAL" if row_origin - row_destiny > 2
			return "ILEGAL" if col_destiny != col_origin
			return "ILEGAL" if board.content(destiny) != "--"
			if (row_origin - row_destiny > 1) && (row_origin != 6)
				return "ILEGAL"
			end
			if board.content(destiny) != "--"
				return "ILEGAL"
			end
			return "LEGAL"
		end
	end
end


class R < Piece
	def initialize
	end
	def move (origin,destiny,board)  # a2 -> a3
		puts "R"
	end
end

class N < Piece
	def initialize
	end

	def move (origin,destiny,board)  # a2 -> a3
		puts "N"
	end
end

class B < Piece
	def initialize
	end

	def move (origin,destiny,board)  # a2 -> a3
		puts "B"
	end
end

class Q < Piece
	def initialize
	end
	def move (origin,destiny,board)  # a2 -> a3
		puts "Q"
	end
end

class K	< Piece
	def initialize
	end
	def move (origin,destiny,board)  # a2 -> a3
		puts "K"
	end
end

