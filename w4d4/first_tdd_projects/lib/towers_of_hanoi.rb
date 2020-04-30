class TowersOfHanoi
  def initialize(disk_count)
    @disk_count = disk_count
    @piles = [(1..disk_count).to_a, [], []]
  end

  def print_towers
    "pile1: " + @piles[0].join(" ") + " pile2: " + @piles[1].join(" ") + " pile3:" + @piles[2].join(" ")
  end

  def move(pos1, pos2)
    raise ArgumentError unless (0...3).include?(pos1) && (0...3).include?(pos2)
    raise "Cannot move a bigger disk to a smaller disk" unless valid_position(pos1, pos2)

    @piles[pos2].unshift(@piles[pos1].shift)
  end

  def valid_position(initial_position, last_position)
    !@piles[initial_position].empty? && (@piles[last_position].empty? || @piles[last_position][-1] > @piles[initial_position][-1])
  end

  def won?
    @piles[1..2].any? {|tower| tower.length == @disk_count}
  end
end 