class PolyTreeNode

  attr_reader :parent, :children, :value

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    @parent.children.delete_if { |n| n == self } unless parent.nil?
    @parent = node
    node.children << self unless node.nil?
  end

  def add_child(node)
    node.parent = self
  end

  def remove_child(node)
    if node.parent == self
      node.parent = nil
    else
      raise "Error: This node doesn't belong to the parent"
    end
  end

  def dfs(target)
    return self if value == target
    return nil if children.empty?

    children.each do |node|
      result = node.dfs(target)
      return result unless result.nil?
    end
    nil
  end

  def bfs(target)

    nodes = [self]

    until nodes.empty?
      checked = nodes.shift
      return checked if checked.value == target

      checked.children.each { |node| nodes << node }
    end
    nil
  end

  def inspect
    "#{value}"
  end

  def to_s
    "#{value}"
  end

end