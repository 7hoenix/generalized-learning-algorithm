class WelcomeController < ApplicationController
  def index
    @root = Node.where(id: 1).first

    @edges1 = Edge.where(from_id: @root.id)
    @level_1_nodes = Node.where(id: @edges1.pluck(:to_id))

    @edges2 = Edge.where(from_id: @level_1_nodes.pluck(:id))
    @level_2_nodes = Node.where(id: @edges2.pluck(:to_id))

    @edges3 = Edge.where(from_id: @level_2_nodes.pluck(:id))
    @level_3_nodes = Node.where(id: @edges3.pluck(:to_id))
  end
end
