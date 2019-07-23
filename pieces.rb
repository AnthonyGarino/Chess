class Piece
    def initialize(color, board, pos)
        @color = color 
        @board = board
        @pos = pos
    end
    
    def empty?
        a,b = @pos
        @board[a][b] == nil
    end

    def valid_moves #phase IV
    end

    def symbol
    end

end

