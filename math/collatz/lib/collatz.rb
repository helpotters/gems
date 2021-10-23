# frozen_string_literal: true

require_relative "collatz/version"

module Collatz
  # Returns the correct pathway of values for a given number
  class CollatzConjecture
    def initialize; end

    def input(num)
      raise ArgumentError.new("Not a whole number") if (num.is_a?(Integer) && (num % 1).zero?) == false
    end
  end
end
