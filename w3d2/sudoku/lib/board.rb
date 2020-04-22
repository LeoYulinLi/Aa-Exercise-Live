require 'colorize'
require_relative "tile"
require "byebug"

class Board

  def initialize(array)
    @board = array
  end

  def self.from_file(file_name)

    array = File.readlines(file_name).map { |line| line.chomp.split("").map { |n| Tile.new(n.to_i, true) } }

    Board.new(array)
  end

  def to_s
    @board.map { |row| row.join(" ") }.join("\n")
  end

  def block(index)
    row = (index / 3)
    col = index % 3
    (0...3).flat_map do |c|
      (0...3).map do |r|
        @board[row * 3 + r][col * 3 + c]
      end
    end
  end

  def block_index(col, row)
    col / 3 + (row / 3) * 3
  end

  def row(index)
    @board[index]
  end

  def col(index)
    @board.transpose[index]
  end

  def [](col, row)
    @board[col][row]
  end

  def []=(col, row, num)
    @board[col][row].num = num
  end

  def valid?(col, row, num)
    # debugger
    a = row(row).map(&:num).none?(num) && col(col).map(&:num).none?(num) && block(block_index(col, row)).map(&:num).none?(num)
    b = !self[col, row].given
    a && b
  end

  def won?
    @board.flatten.map(&:num).none?{ |n| n == 0 }
  end

end
