class HumanPlayer

  attr_reader :mark

  def initialize(mark_value)
    @mark = mark_value
  end

  # "0 1" => [0, 1]
  def get_position(legal_positions)
    print "Enter location "
    response = gets.chomp.split.map(&:to_i)
    until legal_positions.include?(response)
      p "#{response} is not a legal position"
      response = gets.chomp.split.map(&:to_i)
    end
    response
  end

end