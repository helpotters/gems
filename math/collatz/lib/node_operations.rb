# lib/node_operations.rb
# frozen_string_literal: true

require_relative "./node"
require "byebug"

# The manuvers a Collatz obj can perform
module Operations
  extend NodeList

  def even(num)
    num / 2
  end

  def odd(num)
    (num * 3) + 1
  end

  def create_node(num)
    NodeList::Node.new(num)
  end
end

# Explores for Possibly Longer Routes
module ChainExplorer
  # def parent_factors(value = @node.data)
  #   factors = []
  #   even_factor = value / 2
  #   odd_factor = (value * 3).to_d / 3.to_d # #to_d to avoid rounding errors
  #   factors.push(odd_factor.to_i) if (odd_factor % 1).zero?
  #   factors.push(even_factor) if (even_factor % 1).zero?
  # end

  def analyze_branches(node = @node)
    return if node.nil? || node.data.nil?

    factors = parent_factors(node.data)
    return if factors.nil?

    factors.each do |factor|
      node.parent.push(create_node(factor))
    end
  end

  def parent_factors(value = @node.data)
    factors = []
    even_factor = value.to_d * 2.to_d
    factors.push(even_factor.to_i) if even_factor.round == even_factor.to_i

    odd_factor = (value - 1).to_d / 3.to_d # #to_d to avoid rounding errors
    factors.push(odd_factor.to_i) if odd_factor == odd_factor.round # to_i to reverse to_d
    factors
  end
end
