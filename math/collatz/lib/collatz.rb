# frozen_string_literal: true

require_relative "collatz/version"
require_relative "./node"
require "bigdecimal/util"

module CollatzConjecture
  include NodeList
  # Returns the correct pathway of values for a given number
  class Collatz
    attr_reader :node, :result

    def initialize(num)
      @start_num = input(num)
      @node = create_node
      @result = solve(@start_num)
    end

    private

    def input(num)
      raise ArgumentError.new("Not a whole number") if (num.is_a?(Integer) && (num % 1).zero?) == false

      @start_num = num
    end

    public

    def create_node(num = @start_num)
      NodeList::Node.new(num)
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

    def up_analyze(node = @node)
      factors = parent_factors(node.data)
      factors.each { |factor| node.parent.push(create_node(factor)) }
    end

    def parent_factors(value = @node.data)
      factors = []
      even_factor = value * 2
      odd_factor = (value - 1).to_d / 3.to_d # #to_d to avoid rounding errors
      factors.push(odd_factor.to_i) if (odd_factor % 1).zero?
      factors.push(even_factor) if (even_factor % 1).zero?
    end
  end
end
