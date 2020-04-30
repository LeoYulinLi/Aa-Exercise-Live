require "colorize"
require_relative '../game/board'
require_relative 'cursor'

class Display

  attr_reader :cursor
  
  # @param [Board] board
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end

  def to_s
    @board.grid.reverse.map.with_index do |row, y|
      row.map.with_index do |ele, x|
        result = ele.to_s
        if [x, y] == @cursor.cursor_pos
          color = if @cursor.selected
            :red
          else
            :yellow
          end
          result.colorize(:color => ele.color, :background => color)
        else
          result.colorize(:color => ele.color, :background => :green)
        end
      end.join(" ".colorize(:background => :green))
    end.join("\n")
  end

  def render
    puts to_s
    loop do
      @cursor.get_input
      system("clear")
      puts to_s
    end
  end
end

if $PROGRAM_NAME == __FILE__
  board = Board.new
  board.move_piece([1, 0], [2, 1])
  # p board[[0, 1]]
  d = Display.new(board)
  d.render
  # d.cursor.get_input
end
