# frozen_string_literal: true

RSpec.describe CollatzConjecture do
  starting_num = 1220 # Valid number for ease of testing

  # TODO: Refactor code to ban creation of collatz object w/out start num
  describe "#initialization" do
    context "invalid inputs" do
      it "is a string" do
        expect { CollatzConjecture::Collatz.new("asdf") }.to raise_error(ArgumentError)
      end
      it "is a decimal number" do
        expect { CollatzConjecture::Collatz.new(1234.12) }.to raise_error(ArgumentError)
      end
      it "is a null value" do
        expect { CollatzConjecture::Collatz.new(nil) }.to raise_error(ArgumentError)
      end
    end
    context "valid inputs" do
      it "is a whole number" do
        expect { CollatzConjecture::Collatz.new(1234) }.to_not raise_error
      end
    end
  end
  describe "Operations" do
    let(:start_node) { CollatzConjecture::Collatz.new(starting_num) }
    it "creates a new node with @start_num as data" do
      expect(start_node.node.instance_variable_get(:@data)).to eq(starting_num)
    end
    context "recursive #even and #odd" do
      it "should operate on node data" do
        start = CollatzConjecture::Collatz.new(14)
        expect(start.node.data).to eq(14)
      end
      it "end at 1 when starting with even number" do
        even_start = CollatzConjecture::Collatz.new(12)
        # return 1, the last number in the sequence
        expect(even_start.solve).to eq(1)
      end
      it "end at 1 when starting with odd number" do
        odd_start = CollatzConjecture::Collatz.new(13)
        expect(odd_start.solve).to eq(1)
      end
    end
  end
end
