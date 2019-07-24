module Slideable

  DIAGONAL_DIRS = [[1,1], [-1,1], [1,-1], [-1,-1]]
  LINEAR_DIRS = [[0,1],[1,0],[0,-1][-1,0]]

  def moves #will use #move_dirs

    moves = []
    self.move_dirs.each do |pos|

    clone = self.pos.dup
    until clone[0] == 8 || clone[0] == -1 || clone[1] == 8 || clone[1] == -1
      delta_x = self.move_dirs[0]
      delta_y = self.move_dirs[1]
      
  
      clone[0] += delta_x
      clone[1] += delta_y
      moves << clone
    end
    
  end
