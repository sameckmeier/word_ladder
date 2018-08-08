require "spec_helper"

describe WordLadder::Lookup do
  describe :exists? do
    let(:lookup) { WordLadder::Lookup.new(["a", "b", "c"]) }

    context "key exists" do
      it "returns true" do
        expect(lookup.exists?("a")).to eq(true)
      end
    end

    context "key doesn't exist" do
      it "returns true" do
        expect(lookup.exists?("x")).to eq(false)
      end
    end
  end
end
