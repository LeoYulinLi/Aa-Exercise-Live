require_relative 'board'
require_relative 'human_player'

class Game
  def initialize(size, *marks)
    @players = marks.map { |mark| HumanPlayer.new(mark) }
    @board = Board.new(size)
    @player_queue = @players.map { |player| player }
  end

  def switch_turn
    @player_queue.rotate!(1)
  end

  def play
    while @board.empty_positions?
      @board.print
      current_player = @player_queue.first
      @board.place_mark(current_player.get_position, current_player.mark)
      if @board.win?(current_player.mark)
        p "Victory: #{current_player}"
        return
      else
        switch_turn
      end
    end
    p "Draw"
  end

end

game = Game.new(2, :y, :g)
game.play