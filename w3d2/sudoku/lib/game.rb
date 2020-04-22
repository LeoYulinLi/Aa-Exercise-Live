require_relative "board"
require_relative "tile"

class Game

  def initialize(file_name)
    @board = Board.from_file(file_name)
  end

  def play
    until @board.won?
      puts @board.to_s
      print "Enter a location and a number: "
      col, row, num = gets.chomp.split.map(&:to_i)
      if @board.valid?(col, row, num)
        @board[col, row].num = num
      else
        puts "Please enter a valid move."
      end
    end
    puts "You won!"
  end

end

g = Game.new("sudoku1_almost.txt")
g.play