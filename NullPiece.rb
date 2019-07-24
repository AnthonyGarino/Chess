require "singleton"
require_relative "pieces.rb"

class NullPiece < Piece

    attr_reader :color, :symbol
    def initialize
        @color = "no color"
        @symbol = :n
    end
end








# class Board 
#   include Singleton
# end