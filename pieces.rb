class Piece

    attr_accessor :color, :board, :pos

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end
    
    def empty?
        a,b = @pos
        @board[a][b] == nil
    end

    def move_into_check?(end_pos)
        new_board = Board.new
        new_board.board = @board.dup

        new_board.move_piece(@color, @pos, end_pos)
        new_board.in_check?(@color)        
    end

    def valid_moves
      possible_moves = self.moves
      possible_moves.reject { |move| move_into_check?(move) }  
    end
    

    def symbol
        "NullPiece"
    end

    def inspect
        { 'symbol' => self.symbol, 'color' => @color, 'pos' => @pos }.inspect
    end

end