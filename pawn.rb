require_relative "piece.rb"


class Pawn < Piece

    def symbol
        :P
    end

    def move_dirs
    end

    private 

    def at_start_row?
        if self.color == :w
            return true if self.pos[0] == 1
        end

        if self.color == :b
            return true if self.pos[0] == 6
        end
    end

    def forward_dir # return 1 or -1
    end

    def forward_steps
    end

    def side_attacks
    end

end









