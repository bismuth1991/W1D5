class PolyTreeNode
  attr_reader :parent, :children, :value
  # attr_accessor :parent

  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end

  def parent=(parent_node)
    # @parent = parent_node
    # mom = self.parent
    if parent_node == nil
      @parent = nil
      # mom.children.delete(self)
      return
    end

    if !parent_node.already_have_child?(self)
      update_relationship(parent_node)
    end
  end

  def already_have_child?(child_node)
    children.include?(child_node)
  end

  def update_relationship(parent_node)
    if self.parent
      old_parent = self.parent
      old_parent.children.delete(self)
    end

    @parent = parent_node
    parent_node.children.push(self)
  end


end
