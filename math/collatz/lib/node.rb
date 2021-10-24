# lib/node.rb
# frozen_string_literal: true

module NodeList
  # Linked List with Info About Data, Parent, and Child
  class Node
    attr_reader :data
    def initialize(data)
      @data = data
    end
  end
end
