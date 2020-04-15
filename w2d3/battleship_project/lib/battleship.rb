require_relative "board"
require_relative "player"

class Battleship
    attr_reader :board, :player

    def initialize(length)
        @player = Player.new
        @board = Board.new(length)
        @remaining_misses = @board.size / 2
    end

    def start_game
        board.place_random_ships
        board.print
        p board.num_ships
    end

    def lose?
        if @remaining_misses < 1
            p "you lose"
            true
        else
            false
        end
    end

    def win?
        if board.num_ships == 0
            p "you win"
            true
        else
            false
        end
    end

    def game_over?
        lose? || win?
    end

    def turn
        position = player.get_move
        @remaining_misses -= 1 unless board.attack(position)
        board.print
        p @remaining_misses
    end




end
