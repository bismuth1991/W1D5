require 'byebug'

class PolyTreeNode
  attr_reader :parent, :children, :value

  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end

  def parent=(parent_node)
    old_parent = self.parent
    if parent_node.nil?
      old_parent.children.delete(self)
      @parent = nil
    elsif self.parent && parent_node
      old_parent.children.delete(self)
      add_parent(parent_node)
    else
      add_parent(parent_node)
    end
  end

  def add_parent(parent_node)
    @parent = parent_node
    parent_node.children.push(self)
  end

  def add_child(child_node)
    child_node.parent=(self)
  end

  def remove_child(child_node)
    child_node.parent=(nil)
  end

  def dfs(target)
    return self if self.value == target

    children.each do |child_node|
      result = child_node.dfs(target)
      return result if result
    end
    nil
  end

  def inspect
    "#{value}"
  end

  def bfs(target)
    queue = [self]
    until queue.empty?
      current_node = queue.pop
      if current_node.value == target
        return current_node
      else
        current_node.children.each {|child| queue.unshift(child)}
      end
    end

    nil
  end

end

if __FILE__ == $PROGRAM_NAME
  nodes = ('a'..'g').map { |value| PolyTreeNode.new(value) }

  parent_index = 0
  nodes.each_with_index do |child, index|
    next if index.zero?
    child.parent = nodes[parent_index]
    parent_index += 1 if index.even?
  end


  nodes[0].bfs('e')
end
