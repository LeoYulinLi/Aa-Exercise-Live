require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'
require "byebug"

class Game
  def initialize(size, hash)
    @players = hash.map { |mark, is_computer| is_computer ? ComputerPlayer.new(mark) : HumanPlayer.new(mark) }
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
      @board.place_mark(current_player.get_position(@board.legal_positions), current_player.mark)
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
  debugger

machine_civil_war = Game.new(10, h: true, u: true, e: true)
machine_civil_war.play