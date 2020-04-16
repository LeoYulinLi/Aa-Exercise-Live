class ComputerPlayer

  attr_reader :mark

  def initialize(mark_value)
    @mark = mark_value
  end

  # [[0, 0], [0, 1], [1, 0]]
  # .sample => [0, 1]
  def get_position(legal_positions)
    response = legal_positions.sample
    puts "Computer #{mark} chooses position #{response}"
    response
  end

end