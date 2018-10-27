require_relative 'PolyTreeNode/00_tree_node.rb'

class KnightPathFinder
  attr_reader :start_pos

  def initialize(start_pos)
    @start_pos = start_pos
    @root_node = PolyTreeNode.new(start_pos)
    @visited_pos = []
  end

  def build_move_tree
    
  end

  def new_move_nodes(new_moves)
    new_moves.each do |move|
      PolyTreeNode.new(move)
    end
  end

  def new_move_positions(pos)
    new_moves = self.valid_moves - @visited_pos
    @visited_pos += new_moves

    new_moves
  end

  def self.valid_moves(pos)
    x, y = pos
    results = [
      [x - 2, y + 1],
      [x - 1, y + 2],
      [x + 1, y + 2],
      [x + 2, y + 1],
      [x + 2, y - 1],
      [x + 1, y - 2],
      [x - 1, y - 2],
      [x - 2, y - 1]
    ]

    result.select { |move| valid_move?(move) }
  end

  def valid_move?(move)
    x, y = move
    return false if x.between?(0, 7) || y.between?(0, 7)
    true
  end



end
