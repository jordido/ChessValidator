require 'pry'

class Board

	def initialize(file)
		@board_array = []
		File.open(file) do |f|
			f.each_line do |line|
				@board_array << line.split(" ").map{|x| x.to_s}
			end
		end
		@board_array.reverse!
		@col_convers = {"a" => 0, "b" =>1, "c" => 2, "d" => 3, "e" => 4, "f" => 5, "g" => 6, "h" => 7}
	end


	def content (coordinates)
		row = coordinates[0]
		column = coordinates[1]
		@board_array[row][column]
	end

	def color (coordinates)
		content(coordinates)[0]
	end

	def piece_type (coordinates)  # coordinates in numeric array format
		content(coordinates)[1]
	end

	def check_if_empty (destiny) 
		return false if self.content(destiny) != "--"
		return true
	end

	def movement (origin_str, destiny_str)  # coordinates in original format a1, b1, etc
		new_origin = coordinates_to_array(origin_str)
		new_destiny = coordinates_to_array(destiny_str)

		piece = piece_type(new_origin)
		print piece + " " +	origin_str + " " + new_origin.inspect + " -> " + destiny_str + " " + new_destiny.inspect + ": "
		if piece != "-"
			return PieceFactory.for_type(piece).check_move(new_origin, new_destiny, self)
		else
			return "ILEGAL"
		end
	end

	def coordinates_to_array(coordinates)
		[
			coordinates[1].to_i - 1,
			@col_convers[coordinates[0]].to_i	
		]
	end
end

class PieceFactory
	def self.for_type(type)
		Object.const_get(type).new
	end
end


class Piece
	def initialize
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
end

class P < Piece
	def initialize
	end
	def check_move (origin,destiny,board)  # a2 -> a3, coordinates in numeric format
#		puts freeway(origin,destiny,board)
		if board.color(origin) == "-"
			puts "Error color empty origin"
			return "ILEGAL"
		else
			if board.color(origin) == "w"
				color_factor = 1
			else 
				color_factor = -1
			end
			return "ILEGAL" if check_step_forward(origin, destiny, color_factor) == false
			return "ILEGAL" if board.check_if_empty(destiny) == false
			return "LEGAL"
		end
		
	end
	
	def check_step_forward (origin, destiny, color_factor) 
		return false if (origin[0] - destiny[0]) * color_factor > 2 || origin[1] != destiny[1]
		return false if (color_factor == 1) && (origin[0] != 1) && ((origin[0] - destiny[0])*color_factor > 1) 
		return false if (color_factor == -1) && (origin[0] != 6) && ((origin[0] - destiny[0]) > 1) 
		return true
	end

end

class R < Piece
	def initialize
	end
	def check_move (origin,destiny,board)  # a2 -> a3
		puts "R"
	end
end

class N < Piece
	def initialize
	end

	def check_move (origin,destiny,board)  # a2 -> a3
		puts "N"
	end
end

class B < Piece
	def initialize
	end

	def check_move (origin,destiny,board)  # a2 -> a3
		puts "B"
	end
end

class Q < Piece
	def initialize
	end
	def check_move (origin,destiny,board)  # a2 -> a3
		puts "Q"
	end
end

class K	< Piece
	def initialize
	end
	def check_move (origin,destiny,board)  # a2 -> a3
		puts "K"
	end
end