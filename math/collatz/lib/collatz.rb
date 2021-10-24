# frozen_string_literal: true

require_relative "collatz/version"

module CollatzConjecture
  # Returns the correct pathway of values for a given number
  class Collatz
    attr_reader :node

    def initialize(num)
      @start_num = input(num)
      @node = create_node
    end

    private

    def input(num)
      raise ArgumentError.new("Not a whole number") if (num.is_a?(Integer) && (num % 1).zero?) == false

      @start_num = num
    end

    # TODO: even and odd methods
    public

    def create_node
      NodeList::Node.new(@start_num)
    end
  end
end
