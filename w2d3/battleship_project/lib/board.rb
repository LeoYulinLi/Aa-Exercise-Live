class Board
  
  attr_reader :size

  def initialize(n)
    @grid = Array.new(n) { Array.new(n) { :N } }
    @size = n * n
    @width = n
  end

  def [](coordinate)
    row, col = coordinate
    @grid[row][col]
  end

  def []=(coordinate, num)
    row, col = coordinate
    @grid[row][col] = num
  end

  def num_ships
    @grid.flatten.count { |s| s == :S }
  end

  def attack(position)
    if self[position] == :S
      self[position] = :H
      p "you sunk my battleship!"
      true
    else
      self[position] = :X
      false
    end
  end

  #rubocop
  # why not
  # (size / 4).times { rand(0...size) } => need to deal with duplicate rand
  def place_random_ships
    (0...@width).flat_map { |row| (0...@width).map { |column| [row, column] } }
      .shuffle
      .take(size / 4)
      .each { |position| self[position] = :S }
  end

  # Array#flatten
  # Array#each_slice(n)
  # Array#map
  # a = [[1, 2], [3, 4]]
  # b = [1, 2, 3, 4]
  # a.flatten => [1, 2, 3, 4]
  # b.each_slice(2) => [[1, 2], [3, 4]]
  # b.map { |n| n * 2 } => [2, 4, 6, 8] # this is new array
  #
  # # Shallow Copy
  # c = [1, 2 ,3]
  # d = c
  # c[0] = 100
  # p d => [100, 2, 3]


  # def hidden_ships_grid
  #   @grid.flatten.map { |s| s == :S ? :N : s }.each_slice(2).to_a
  # end


  def hidden_ships_grid
    hidden = []

    @grid.each do |row|
      new_row = []
      row.each do |ele|
        # new_row << ele == :S ? :N : ele
        new_row << if ele == :S
                     :N
                   else
                     ele
                   end
      end
      hidden << new_row
    end

    hidden
  end

  # S N
  # X S
  # Also: 
  # def self.print_grid(grid)
  #   grid.each do |row|
  #     print row.join(" ")
  #     print "\n"
  #   end
  # end
  def self.print_grid(grid)
    grid.each do |row|
      row.each_with_index do |ele, index|
        if index != row.length - 1
          print "#{ele} "
        else
          print "#{ele}"
        end
      end
      print "\n"
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(hidden_ships_grid)
  end

end
