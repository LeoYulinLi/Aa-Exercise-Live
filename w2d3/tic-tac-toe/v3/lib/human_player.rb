class HumanPlayer

  attr_reader :mark

  def initialize(mark_value)
    @mark = mark_value
  end

  def get_position
    print "Enter location "
    gets.chomp.split.map(&:to_i)
  end

end