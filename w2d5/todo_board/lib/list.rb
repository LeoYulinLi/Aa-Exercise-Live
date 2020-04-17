require_relative 'item'
class List
  attr_accessor :label

  def initialize(label)
    @label = label
    @items = []
  end

  def add_item(title, deadline, description = '')
    begin
      @items << Item.new(title, deadline, description)
    rescue RuntimeError
      return false
    end
    true
  end

  def size
    @items.length
  end

  def valid_index?(index)
    !(index < 0 || index > @items.length - 1)
  end

  def swap(index1, index2)
    return false if !valid_index?(index1) || !valid_index?(index2)

    @items[index1], @items[index2] = @items[index2], @items[index1]

  end

  def [](index)
    return nil unless valid_index?(index)
    @items[index]
  end

  def priority
    @items.first
  end

  def print
    puts "=============#{label.upcase}============="
    puts "#{"index".ljust(5)} #{"title".ljust(32)} #{"deadline".ljust(10)} #{"done".ljust(5)}"
    @items.each_with_index do |item, index|
      puts "#{index.to_s.ljust(5)} #{item.title.ljust(32)} #{item.deadline.ljust(10)} #{item.done ? "[x]" : "[ ]"}"
    end
  end

  def print_full_item(index)
    print_item(self[index])
  end

  def print_item(item)
    puts "#{item.done ? "[x]" : "[ ]"}#{item.title} #{item.deadline} \n #{item.description}" if item
  end

  def print_priority
    print_item(priority)
  end

  def up(index, amount = 1)
    (index.downto(index - amount + 1)).each do |i|
      swap(i, i - 1)
    end

  end

  def down(index, amount = 1)
    (0...amount).each do |i|
      swap(index + i, index + i + 1)
    end
  end

  def sort_by_date!
    @items.sort_by!(&:deadline)
  end

  def toggle_item(index)
    self[index].toggle if valid_index?(index)
  end

  def remove_item(index)
    return false unless valid_index?(index)

    @items.delete_at(index)
    true
  end

  def purge
    @items.reject!(&:done)
  end

end