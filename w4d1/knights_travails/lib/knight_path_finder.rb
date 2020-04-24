require_relative "../../../w3d5/poly_tree_node/lib/00_tree_node.rb"

class KnightPathFinder
  def initialize(start)
    @start = start
    @considered_positions = [start]
  end

  def self.valid_moves(pos)
    x, y = pos
    potential_positions = [
      [x + 1, y + 2],
      [x + 2, y + 1],
      [x - 1, y + 2],
      [x - 2, y + 1],
      [x + 1, y - 2],
      [x + 2, y - 1],
      [x - 1, y - 2],
      [x - 2, y - 1]
    ]
    potential_positions.select { |(x, y)| (0...8).include?(x) && (0...8).include?(y) }
  end

  def new_move_positions(pos)
    KnightPathFinder.valid_moves(pos).reject { |p| @considered_positions.include?(p) }
  end

  def build_move_tree(target)
    tree = PolyTreeNode.new(@start)
    queue = [tree]
    until queue.empty?
      current_node = queue.shift
      return current_node if current_node.value == target

      queue += new_move_positions(current_node.value).map do |p|
        new_node = PolyTreeNode.new(p)
        @considered_positions << new_node.value
        new_node.parent = current_node
        new_node
      end
    end
    tree
  end

  def trace_path_back(node)
    result = [node.value]
    until node.parent.nil?
      result.unshift(node.parent.value)
      node = node.parent
    end
    result
  end

  def find_path(end_position)
    node = build_move_tree(end_position)
    trace_path_back(node)
  end

end

k = KnightPathFinder.new([0, 0])
t =  k.find_path([7,6])

p t