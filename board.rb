require_relative 'pieces.rb'

class Board 

    attr_accessor :board
    def initialize
        @board = Array.new(8){Array.new(8)}
        self.populate
    end

    def make_move(start_pos, end_pos)
        a,b = start_pos #1,2
        x,y = end_pos 
        raise ArgumentError.new "no piece at starting position" if self.board[a][b] == nil
        
        self.board[x][y], self.board[a][b] = self.board[a][b], nil
    end
    
    def populate
        @board[0].map! {|ele| Piece.new}
        @board[1].map! {|ele| Piece.new}
        @board[2].map! {|ele| nil}
        @board[3].map! {|ele| nil}
        @board[4].map! {|ele| nil}
        @board[5].map! {|ele| nil}
        @board[6].map! {|ele| Piece.new}
        @board[7].map! {|ele| Piece.new}
    end

end
