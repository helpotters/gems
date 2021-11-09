# frozen_string_literal: true

require_relative "collatz/version"
require_relative "./node_modules"
require "bigdecimal/util"

# Creates Collatz Tree for Self-Analysis
module CollatzConjecture
  # Returns the correct pathway of values for a given number
  class Collatz
    include NodeList
    include Operations
    include ChainExplorer
    attr_reader :node, :result

    def initialize(num)
      @start_num = input(num)
      @node = create_node
      @result = solve(@start_num)
    end

    private

    def input(num)
      raise ArgumentError, "Not a whole number" if (num.is_a?(Integer) && (num % 1).zero?) == false

      @start_num = num
    end

    public

    def solve(num)
      return 1 if num == 1

      result = num.even? ? even(num) : odd(num)
      solve(result)
    end
  end
end
