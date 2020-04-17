require_relative "passenger"

class Flight

  attr_reader :passengers

  def initialize(flight_number, capacity)
    @flight_number = flight_number
    @capacity = capacity
    @passengers = []
  end

  def full?
    @passengers.length == @capacity
  end

  def board_passenger(passenger_instance)
    @passengers << passenger_instance if passenger_instance.has_flight?(@flight_number) && !full?
  end

  def list_passengers
    @passengers.map(&:name)
  end

  def [](index)
    @passengers[index]
  end

  def <<(passenger_instance)
    board_passenger(passenger_instance)
  end

end