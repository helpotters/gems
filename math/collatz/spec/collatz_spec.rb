# frozen_string_literal: true

RSpec.describe CollatzConjecture do
  starting_num = 1220 # Valid number for ease of testing

  # TODO: Refactor code to ban creation of collatz object w/out start num
  context "#initialization" do
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
      it "end at 1 when starting with even number" do
        even_start = CollatzConjecture::Collatz.new(12)
        # return 1, the last number in the sequence
        expect(even_start.result).to eq(1)
      end
      it "end at 1 when starting with odd number" do
        odd_start = CollatzConjecture::Collatz.new(13)
        expect(odd_start.result).to eq(1)
      end
    end
  end
  describe "Chain Explorer" do
    let(:one_factor) { CollatzConjecture::Collatz.new(1220) }
    let(:multi_factor) { CollatzConjecture::Collatz.new(16) }
    context "#up_analyze" do
      context "check parent factors" do
        it "should return one factor" do
          expect(one_factor.parent_factors).to match_array([2440])
        end
        it "should return two factors" do
          expect(multi_factor.parent_factors).to match_array([32, 5])
        end
      end
      context "create and analyze parent nodes" do
        it "should create one parent node" do
          one_factor.up_analyze
          expect(one_factor.node.parent.length).to eq(1)
        end
        it "should create two parent nodes" do
          multi_factor.up_analyze
          expect(multi_factor.node.parent.length).to eq(2)
        end
      end
    end
    xcontext "#set_new_root" do
      # TODO: restructures the "winner node" if the parent includes it TODO:
      # moves on if the child includes the parent node
    end
  end
end
