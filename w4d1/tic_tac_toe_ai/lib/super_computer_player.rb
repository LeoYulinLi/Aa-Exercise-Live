require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer


  # @param [TicTacToe] game
  # @param [Symbol] mark
  #
  # @return [Array<Integer>]
  #
  def move(game, mark)
    potential_moves = TicTacToeNode.new(game.board, mark).children
    .select { |n| n.winning_node?(mark) }

    other_mark = mark == :x ? :o : :x

    potential_moves += TicTacToeNode.new(game.board, mark).children
      .select { |n| !n.losing_node?(mark) }

    potential_move = potential_moves.first.prev_move_pos

    potential_move.nil? ? (raise "There are no valid moves") : potential_move
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
