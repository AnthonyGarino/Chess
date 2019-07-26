require "colorize"
require_relative 'cursor.rb'
require_relative 'board.rb'

require 'byebug'
class Display

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
    end

    def render
        # debugger
        @board.each do |row| 
            array = row.map do |piece|
                piece.symbol
            end
            puts array.join(" ")
        end
        nil
    end

end

