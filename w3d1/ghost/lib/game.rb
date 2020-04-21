require 'net/http'
require 'uri'
require 'set'
require_relative 'player'

class Game

  attr_reader :current_player, :previous_player

  def initialize
    @dictionary = Net::HTTP.get(URI.parse(
      "https://assets.aaonline.io/fullstack/ruby/projects/ghost/dictionary.txt"
    )).split("\n").to_set
    @player1 = Player.new("Player1")
    @player2 = Player.new("Player2")
    @current_player = @player1
    @previous_player = @player2
    @fragment = ''
  end

  def play_round

    input = take_turn(current_player)
    until @dictionary.include?(input)
      next_player!
      input = take_turn(current_player)
    end
    p " #{current_player} lose"
  end

  def next_player!
    @current_player = @current_player == @player1 ? @player1 : @player2
    @previous_player = @current_player
  end

  def take_turn(player)
    puts "Please enter letter: "
    input = gets.chomp
    until valid_play?(input)
      puts "Please enter a valid input:  "
      input = gets.chomp
    end
    input
  end

  def valid_play?(string)
    @dictionary.any? { |word| word.start_with?(@fragment + string) }
  end

end

me = Game.new
me.play_round
