class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    target = self.find { |node| node.key == key } #refering to linklist.find
    return nil if target.nil?
    target.val
  end

  def include?(key)
    self.any? { |node| node.key == key }
  end

  def append(key, val)
    new_node = Node.new(key, val)
    old_node = @tail.prev
    old_node.next = new_node
    new_node.prev = old_node
    @tail.prev = new_node
    new_node.next = @tail
  end

  def update(key, val)
    target = self.find { |node| node.key == key } #refering to linklist.find
    target.val = val unless target.nil?
  end

  def remove(key)
    target = self.find { |node| node.key == key } #refering to linklist.find
    return false if target.nil?

    previous_node = target.prev
    next_node = target.next

    previous_node.next = next_node
    next_node.prev = previous_node

    true
  end

  def each
    current_node = @head
    until current_node.next == @tail
      yield current_node.next
      current_node = current_node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
