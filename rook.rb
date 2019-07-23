require_relative slideable.rb

class Rook < Piece

    include Slideable

    def symbol
       :R 
    end

    def move_dirs
        LINEAR_DIRS
    end

end