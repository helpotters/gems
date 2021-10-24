# lib/node.rb
# frozen_string_literal: true

module NodeList
  # Linked List with Info About Data, Parent, and Child
  class Node
    attr_reader :data
    attr_writer :parent
    attr_accessor :child

    def initialize(data)
      @data = data
      @parent = nil
      @child = nil
    end
  end
end
