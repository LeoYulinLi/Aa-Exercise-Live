require_relative 'list'
require_relative 'item'

class TodoBoard
  def initialize
    @lists = {}
  end

  def get_command
    print "Enter a command: "
    command = gets.chomp.split
    list_label = command[1]
    case command[0]
    when 'mklist'
      @lists[list_label] = List.new(list_label)
    when 'ls'
      @lists.values.map(&:label).each { |label| puts label }
    when 'showall'
      @lists.values.each(&:print)
    when 'mktodo'
      _, list_label, title, deadline, description = command
      @lists[list_label].add_item(title, deadline, description || '')
    when 'up'
      index = command[2].to_i
      amount = command[3].to_i
      command[3] ? @lists[list_label].up(index, amount) : @lists.up(index)
    when 'down'
      index = command[2].to_i
      amount = command[3].to_i
      command[3] ? @lists[list_label].down(index, amount) : @lists.down(index)
    when 'swap'
      index1 = command[2].to_i
      index2 = command[3].to_i
      @lists[list_label].swap(index1, index2)
    when 'sort'
      @lists[list_label].sort_by_date!
    when 'priority'
      @lists[list_label].print_priority

    when 'print'
      index = command[2].to_i if command.length == 3
      index ? @lists[list_label].print_full_item(index) : @lists[list_label].print
    when 'toggle'
      index = command[2].to_i if command.length == 3
      @lists[list_label].toggle_item(index) if index
    when 'rm'
      index = command[2].to_i if command.length == 3
      @lists[list_label].remove_item(index) if index
    when 'purge'
      @lists[list_label].purge
    when 'quit'
      return false
    else
      print "Invalid Command #{command[0]}, try again: "
    end
    true
  end

  def run
    while get_command;
    end
  end

end

TodoBoard.new.run