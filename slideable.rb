require 'byebug'
module Slideable

  DIAGONAL_DIRS = [[1,1], [-1,1], [1,-1], [-1,-1]]
  LINEAR_DIRS = [[0,1],[1,0],[0,-1],[-1,0]]

  def moves

    moves = []
    self.move_dirs.each do |arr|
      clone = self.pos.dup
      debugger
      future_color = self.board[clone[0] + arr[0]][clone[1] + arr[1]].color
      # debugger
      until clone[0] == 7 || clone[0] == 0 || clone[1] == 7 || clone[1] == 0 || future_color == self.color

        future_color = self.board[clone[0] + arr[0]][clone[1] + arr[1]].color
        clone_future_color = future_color.dup
        x = clone[0] += arr[0]
        y = clone[1] += arr[1]
        anthony = [x, y].dup
        moves << anthony

        #debugger
        if clone_future_color != self.color && clone_future_color != "no color"
          break
        end
      end
    end

    # moves.flatten.each_slice(2).to_a.uniq
    moves

  end

end
