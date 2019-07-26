require_relative 'pieces.rb'
require_relative 'rook.rb'
require_relative 'NullPiece.rb'
require_relative 'bishop.rb'
require_relative 'queen.rb'
require_relative 'knight.rb'
require_relative 'king.rb'
require_relative 'pawn.rb'

class Board 

    attr_accessor :board
    def initialize
        @board = Array.new(8){Array.new(8)}
        self.populate
    end

    def find_king_pos(color)
      @board.each_with_index do |row, i|
        row.each_with_index do |piece, i2|
          return [i, i2] if piece.symbol == :K && piece.color == color
        end
      end
    end

    def in_check?(color)
        all_moves = []
        @board.each_with_index do |row, i|
            row.each_with_index do |piece, i2|
            all_moves.concat(piece.moves) if piece.color != color && piece.symbol != :n
            end
        end
        king_pos = self.find_king_pos(color)
        all_moves.include?(king_pos)
    end





    
    def make_move(start_pos, end_pos)
        a,b = start_pos #1,2
        x,y = end_pos 
        raise ArgumentError.new "no piece at starting position" if self.board[a][b] == nil
        
        self.board[x][y], self.board[a][b] = self.board[a][b], nil
    end
    
    def populate
        @board[0][0] = Rook.new(:w, @board, [0, 0])
        @board[0][1] = Knight.new(:w, @board, [0, 1])
        @board[0][2] = Bishop.new(:w, @board, [0, 2])
        @board[0][3] = Queen.new(:w, @board, [0, 3])
        @board[0][4] = King.new(:w, @board, [0, 4])
        @board[0][5] = Bishop.new(:w, @board, [0, 5])
        @board[0][6] = Knight.new(:w, @board, [0, 6])
        @board[0][7] = Rook.new(:w, @board, [0, 7])

        @board[1].map!.with_index {|arr, i| Pawn.new(:w, @board, [1, i])}
        @board[2].map!.with_index {|arr, i| NullPiece.new}
        @board[3].map!.with_index {|arr, i| NullPiece.new}
        @board[4].map!.with_index {|arr, i| NullPiece.new}
        @board[5].map!.with_index {|arr, i| NullPiece.new}
        @board[6].map!.with_index {|arr, i| Pawn.new(:b, @board, [6, i])}
        
        @board[7][0] = Rook.new(:b, @board, [7, 0])
        @board[7][1] = Knight.new(:b, @board, [7, 1])
        @board[7][2] = Bishop.new(:b, @board, [7, 2])
        @board[7][3] = Queen.new(:b, @board, [7, 3])
        @board[7][4] = King.new(:b, @board, [7, 4])
        @board[7][5] = Bishop.new(:b, @board, [7, 5])
        @board[7][6] = Knight.new(:b, @board, [7, 6])
        @board[7][7] = Rook.new(:b, @board, [7, 7])
    end

end
 
# 1. Write a Display class to handle your rendering logic. Display class should access the board. Require the colorize gem so you can render in color.
# 2. Download this cursor.rb file.  Initialize Cursor with a cursor_pos and an instance of Board. The cursor manages user input, according to which it updates its @cursor_pos. The display will render the square at @cursor_pos in a different color. Within display.rb require cursor.rb and set the instance variable @cursor to Cursor.new([0,0], board).
# In cursor.rb we've' provided a KEYMAP that translates keypresses into actions and movements. The MOVES hash maps possible movement differentials. You can use the #get_input method as is. #read_charhandles console input. Skim over #read_char to gain a general understanding of how the method works. 
# 3. Fill in the #handle_key(key) method. Use a case statement that switches on the value of key. Depending on the key, #handle_key(key) will a) return the @cursor_pos (in case of :return or :space), b) call #update_poswith the appropriate movement difference from MOVES and return nil (in case of :left, :right, :up, and :down), or c) exit from the terminal process (in case of :ctrl_c). 
# NB: To exit a terminal process, use the Process.exit method. Pass it the status code 0 as an argument. 
# # 5. Fill in the #update_pos(diff) method. 
# # It should use the diff to reassign @cursor_pos to a new position. 
# # You may wish to write a Board#valid_pos? method to ensure you update @cursor_pos only when the new position is on the board.
# 6. Render the square at the @cursor_pos display in a different color. 
# A nice but optional addition to your cursor class is a boolean instance variable selected that will allow you to display the cursor in a different color when it has selected a piece. To implement this you will need to #toggle_selectedeverytime :return or :space is hit.

# Phase IV: Board#in_check?(color) and Board#checkmate?(color)
# 1. Create an #in_check?(color) method for board that returns whether a player is in check. You can implement this by (1) finding the position of the King on the board then (2) seeing if any of the opposing pieces can move to that position.
# 2. Then write a #checkmate?(color) method. If the player is in check, and if none of the player's pieces have any #valid_moves (to be implemented in a moment), then the player is in checkmate.
# NB Here's' a four-move sequence to get to checkmate from a starting board for your checkmate testing:
# f2, f3
# e7, e5
# g2, g4
# d8, h4
