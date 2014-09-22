require_relative '../ChessValidator'

describe 'Board' do
  before {@board = Board.new('board.txt')}
  describe "check_if_empty" do

  	it "check_if_empty e4, free" do
  		expect(@board.check_if_empty([3,4])).to eq true
  	end
    it "check_if_empty e2, occupied" do
      expect(@board.check_if_empty([1,4])).to eq false
    end

  end

  describe "move con parámetros numéricos" do 
  	it "move a Pawn from e2 to e4, free square" do
  		expect(P.new.move([1,4],[3,4], @board)).to eq ("LEGAL")
  	end

    it "move a Pawn from f2 to f3, occupied square" do
      expect(P.new.move([1,5],[2,5], @board)).to eq ("ILEGAL")
    end

    it "move a Pawn from e2 to f4, incorrect crossed movement" do
      expect(P.new.move([1,4],[2,5], @board)).to eq ("ILEGAL")
    end
  end

  describe "movement con param alfabeticos, y que llama a move" do
    it "move a Pawn from f2 to f4, free square" do
      expect(@board.movement("f2","f4")).to eq ("LEGAL")
    end
    it "move a Pawn from f6 to f5, one step legal" do
      expect(@board.movement("f6","f5")).to eq ("LEGAL")
    end
    it "move a Pawn from e7 to e5, two steps legal" do
      expect(@board.movement("e7","e5")).to eq ("LEGAL")
    end
    it "move a Pawn from f6 to f4, two steps ilegal" do
      expect(@board.movement("f6","f4")).to eq ("ILEGAL")
    end
    it "move a Pawn from f5 to f3, two steps ilegal" do
      expect(@board.movement("f5","f3")).to eq ("ILEGAL")
    end
    it "move a Pawn from a2 to a3, one step and free square" do
      expect(@board.movement("a2","a3")).to eq ("LEGAL")
    end
    it "move a Pawn from a2 to b4, invalid crossing" do
      expect(@board.movement("a2","b4")).to eq ("ILEGAL")
    end
  end

end