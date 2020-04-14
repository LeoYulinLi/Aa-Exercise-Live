require_relative "room"

class Hotel

  attr_reader :name, :rooms

  def initialize(name, hash)
    @name = name
    @rooms = hash.map { |k, v| [k, Room.new(v)] }.to_h
  end

  def name
    @name.split(" ").map { |word| word.capitalize }.join(" ")
  end

  def room_exists?(string)
    rooms.has_key?(string)
  end

  def check_in(person, room_name)
    if room_exists?(room_name)
      if rooms[room_name].add_occupant(person)
        p "check in successful"
      else
        p "sorry, room is full"
      end
    else
      p "sorry, room does not exist"
    end
  end

  def has_vacancy?
    rooms.any? { |name, room| !room.full? }
  end

  def list_rooms
    rooms.each { |name, room| puts "#{name} #{room.available_space}" }
  end

end
