# frozen_string_literal: true

require_relative "collatz/version"

module Collatz
  # Returns the correct pathway of values for a given number
  class CollatzConjecture
    attr_reader :start_num
    def initialize
      @start_num = nil
    end

    def input(num)
      raise ArgumentError.new("Not a whole number") if (num.is_a?(Integer) && (num % 1).zero?) == false
      @start_num = num
    end
  end
end
