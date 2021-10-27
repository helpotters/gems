# lib/node.rb
# frozen_string_literal: true

module NodeList
  # Linked List with Info About Data, Parent, and Child
  class Node
    attr_reader :data
    attr_accessor :child, :parent

    def initialize(data)
      @data = data
      @parent = []
      @child = nil
    end
  end
end
