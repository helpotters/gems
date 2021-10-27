# frozen_string_literal: true

require_relative "collatz/version"
require_relative "./node"

module CollatzConjecture
  include NodeList
  # Returns the correct pathway of values for a given number
  class Collatz
    attr_reader :node, :result

    def initialize(num)
      @start_num = input(num)
      @node = create_node
      @result = solve(@node.data)
    end

    private

    def input(num)
      raise ArgumentError.new("Not a whole number") if (num.is_a?(Integer) && (num % 1).zero?) == false

      @start_num = num
    end

    public

    def create_node
      NodeList::Node.new(@start_num)
    end

    def solve(num)
      return 1 if num == 1

      result = num.even? ? even(num) : odd(num)
      solve(result)
    end

    def even(num)
      num / 2
    end

    def odd(num)
      (num * 3) + 1
    end
  end
end
