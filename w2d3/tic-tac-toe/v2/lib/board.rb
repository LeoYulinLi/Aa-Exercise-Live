class Board

  def initialize(length)
    @length = length
    @grid = Array.new(length) { Array.new(length) { '_' } }
  end

  def [](position)
    row, column = position
    @grid[row][column]
  end

  def []=(position, mark)
    row, column = position
    @grid[row][column] = mark
  end

  def valid?(position)
    row, column = position
    self[position] != nil && row >= 0 && column >= 0
  end

  def empty?(position)
    self[position] == '_'
  end

  def place_mark(position, mark)
    if valid?(position) && empty?(position)
      self[position] = mark
    else
      raise Exception.new("Bad Move")
    end
  end

  def print
    puts @grid.map { |row| row.map(&:to_s).join(" ") }.join("\n")
  end

  def win_row?(mark)
    @grid.any? { |row| row.uniq.length == 1 && row[0] == mark }
  end

  def win_col?(mark)
    @grid.transpose.any? { |row| row.uniq.length == 1 && row[0] == mark }
  end

  def win_diagonal?(mark)
    d1 = @grid.each_index.map do |i|
      @grid[i][i] == mark
    end.all?

    d2 = @grid.each_index.map do |i|
      @grid[i][-1 - i] == mark
    end.all?
    d1 || d2
  end

  def win?(mark)
    win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
  end

  def empty_positions?
    @grid.flatten.any? { |s| s == "_" }
  end
end