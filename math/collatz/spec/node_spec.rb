# node_spec.rb
# frozen_string_literal: true

# TODO: Fix relative links; not best practice
require_relative "./../lib/node"

RSpec.describe NodeList do
  context "is a linked list that contains info about its parents and child" do
    let(:node) { NodeList::Node.new(123) }
    let(:parent_node) { NodeList::Node.new(456) }
    let(:child_node) { NodeList::Node.new(789) }

    it "has a readable instance variable for its data" do
      expect(node.data).to eq(123)
    end
    it "directs to parent and child nodes" do
      node.parent = parent_node
      expect(node.instance_variable_get(:@parent)).to eq(parent_node)
      node.child = child_node
      expect(node.instance_variable_get(:@child)).to eq(child_node)
    end
  end
end
