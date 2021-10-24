# node_spec.rb
# frozen_string_literal: true
require_relative "./../lib/node"

RSpec.describe NodeList do
  context "is a linked list that contains info about its parents and child" do
    it "has a readable instance variable for its data" do
      data_node = NodeList::Node.new(123)
      expect(data_node.data).to eq(123)
    end
    xit "has child and parent instance variables" do
      expect(node.instance_variable_get(:@parent))
    end
  end
end
