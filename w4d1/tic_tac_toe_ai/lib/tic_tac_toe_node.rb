require_relative 'tic_tac_toe'

class TicTacToeNode

  # @return [Board]
  attr_reader :board

  # @return [Symbol]
  attr_reader :next_mover_mark

  # @return [Array<Integer>]
  attr_reader :prev_move_pos

  # @param [Board] board
  # @param [Symbol] next_mover_mark
  # @param [Array] prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end


  # @param [Symbol] evaluator
  #
  # @return [Boolean]
  #
  def losing_node?(evaluator)
    return board.over? && !board.tied? && board.winner != evaluator if children.empty?
    if evaluator == next_mover_mark
      children.all? { |n| n.losing_node?(evaluator) }
    else
      children.any? { |n| n.losing_node?(evaluator) }
    end
  end

  def winning_node?(evaluator)
    return board.over? && board.winner == evaluator if children.empty?
    if evaluator == next_mover_mark
      children.any? { |n| n.winning_node?(evaluator) }
    else
      children.all? { |n| n.winning_node?(evaluator) }
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  #
  # @return [Array<TicTacToeNode>]
  #
  def children
    mark = next_mover_mark == :x ? :o : :x
    (0...3).flat_map { |x| (0...3).map { |y| [x, y] } }
      .select { |pos| board.empty?(pos) }
      .map do |pos|
      next_board = board.dup
      next_board[pos] = next_mover_mark
      [pos, next_board]
    end
      .map { |(pos, b)| TicTacToeNode.new(b, mark, pos) }
  end
end
