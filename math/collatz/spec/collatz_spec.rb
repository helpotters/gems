# frozen_string_literal: true

RSpec.describe Collatz do
  let(:collatz) { Collatz::CollatzConjecture.new }
  describe "#input" do
    it "only allows whole numbers as an input" do
      expect { collatz.input("asdf") }.to raise_error(ArgumentError)
      expect { collatz.input(1234.12) }.to raise_error(ArgumentError)
      expect { collatz.input(12) }.to_not raise_error
    end

    it "sets the starting number as an instance variable" do
      collatz.input(13)
      expect(collatz.start_num).to eq(13)
    end
  end

  context "tree building" do

  end
end
