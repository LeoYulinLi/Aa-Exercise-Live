class Tile

  attr_accessor :num
  attr_reader :given

  def initialize(num = 0, given = false)
    @num = num
    @given = num == 0 ? false : given
  end

  def to_s
    given ? num.to_s.colorize(:red) : num.to_s
  end

end