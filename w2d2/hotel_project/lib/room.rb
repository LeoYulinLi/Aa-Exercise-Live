class Room
  attr_reader :capacity, :occupants
  attr_writer :occupants

  def initialize(capacity)
    @capacity = capacity
    @occupants = []

  end

  def full?
    occupants.length == capacity
  end

  def available_space
    capacity - occupants.length
  end

  def add_occupant(person)
    if !full?
      occupants << person
      true
    else
      false
    end
  end


end
