# node_operations_spec.rb

RSpec.describe Operations do
  starting_num = 1220 # Valid number for ease of testing
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
RSpec.describe ChainExplorer do
  starting_num = 1220 # Valid number for ease of testing
  let(:one_factor) { CollatzConjecture::Collatz.new(1220) }
  let(:multi_factor) { CollatzConjecture::Collatz.new(16) }
  before do
    one_factor.solve
    multi_factor.solve
  end
  context "#analyze_branches" do
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
        one_factor.analyze_branches
        expect(one_factor.node.parent.length).to eq(1)
      end
      it "should create two parent nodes" do
        multi_factor.analyze_branches
        expect(multi_factor.node.parent.length).to eq(2)
      end
    end
    context "recursively climb tree and compare common multi=paths" do
      let(:start_node) { CollatzConjecture::Collatz.new(12) }
      # TODO: What is the exit condition?
    end
  end
end
