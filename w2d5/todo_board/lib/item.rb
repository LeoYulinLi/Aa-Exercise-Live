class Item
  attr_accessor :title, :description
  attr_reader :done, :deadline

  def self.valid_date?(date_string)
    y, m, d = date_string.split('-').map(&:to_i)
    (1000...9999).include?(y) && (1..12).include?(m) && (1..31).include?(d)
  end

  def initialize(title, deadline, description)
    raise 'date is not valid' unless Item.valid_date?(deadline)

    @title = title
    @deadline = deadline
    @description = description
    @done = false
  end

  def deadline=(date_string)
    raise 'date is not valid' unless Item.valid_date?(date_string)

    @deadline = date_string
  end

  def toggle
    @done = !@done
  end

end