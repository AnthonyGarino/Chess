require_relative 'pieces.rb'
require_relative 'rook.rb'
require_relative 'NullPiece.rb'
require_relative 'bishop.rb'
require_relative 'queen.rb'
require_relative 'knight.rb'
require_relative 'king.rb'
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
        @board[0].map!.with_index {|arr, i| Knight.new(:w, @board, [0, i])}
        @board[1].map!.with_index {|arr, i| King.new(:w, @board, [1, i])}
        @board[2].map!.with_index {|arr, i| NullPiece.new}
        @board[3].map!.with_index {|arr, i| NullPiece.new}
        @board[4].map!.with_index {|arr, i| NullPiece.new}
        @board[5].map!.with_index {|arr, i| NullPiece.new}
        @board[6].map!.with_index {|arr, i| Queen.new(:b, @board, [6, i])}
        @board[7].map!.with_index {|arr, i| Rook.new(:b, @board, [7, i])}
    end

end
