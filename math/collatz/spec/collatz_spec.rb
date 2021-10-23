# frozen_string_literal: true

RSpec.describe Collatz do
  let(:collatz) { Collatz::CollatzConjecture.new }
  context "input" do
    it "only allows whole numbers as an input" do
      expect { collatz.input("asdf") }.to raise_error(ArgumentError)
      expect { collatz.input(1234.12) }.to raise_error(ArgumentError)
    end
  end
end
