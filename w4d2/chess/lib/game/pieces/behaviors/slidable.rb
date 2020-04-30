module Slidable


  def directions
    raise "direction not implemented"
  end

  def possible_moves
    directions.flat_map { |dir| trace_path(dir) }
  end

  private

  # a = [1, 2] # position
  # b = [0, 1] # direction
  # a.zip(b) => [[1, 0], [2, 1]] # c
  # c.map(&:sum)
  # [[1 + 0], [2 + 1]] => [1, 3] # final position
  #
  # a + b
  # @param [Array<Integer>] direction
  # @return [Array<Array<Integer>>] a line of points
  def trace_path(direction)
    result = []
    current_position = position
    while valid_position?(current_position)
      current_position = current_position.zip(direction).map(&:sum)
      break if valid_position?(current_position)

      result << current_position
      
      break unless board.empty?(current_position)
    end
    result
  end


end