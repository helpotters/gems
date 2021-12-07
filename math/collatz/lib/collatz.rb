# frozen_string_literal: true

require_relative "collatz/version"
require_relative "./node_operations"
require "bigdecimal/util"

# Creates Collatz Tree for Self-Analysis
module CollatzConjecture
  # Returns the correct pathway of values for a given number
  class Collatz
    include Operations
    include ChainExplorer
    attr_reader :node, :result

    def initialize(num)
      @start_num = input(num)
      @node = create_node(@start_num)
      @result = solve(@node)
      @chain_length = 0
    end

    def solve(node = @node)
      return 1 if node.data == 1

      # analyze_branches(node)
      result = node.data.even? ? even(node.data) : odd(node.data)
      solve(create_node(result))
    end

    private

    def input(num)
      raise ArgumentError, "Not a whole number" if (num.is_a?(Integer) && (num % 1).zero?) == false

      @start_num = num
    end
  end
end
