class Piece

    attr_accessor :color
    attr_reader :pos, :board

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
        "NullPiece"
    end

    def inspect
        { 'symbol' => self.symbol, 'color' => @color, 'pos' => @pos }.inspect
    end

end