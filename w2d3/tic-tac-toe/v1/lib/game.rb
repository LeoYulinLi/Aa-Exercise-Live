require_relative 'board'
require_relative 'human_player'

class Game
  def initialize(player1_mark, player2_mark)
    @player1 = HumanPlayer.new(player1_mark)
    @player2 = HumanPlayer.new(player2_mark)
    @board = Board.new
    @current_player = @player1
  end

  def switch_turn
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def play
    while @board.empty_positions?
      @board.print
      @board.place_mark(@current_player.get_position, @current_player.mark)
      if @board.win?(@current_player.mark)
        p "Victory: #{@current_player}"
        return
      else
        switch_turn
      end
    end
    p "Draw"
  end

end

game = Game.new(:x, :o)
game.play