require "spec_helper"

describe WordLadder::Utilities do
  describe :binary_search do
    context "el exists" do
      let(:arr) do
        ["aPple", "bad", "cool", "Donut", "e"]
      end

      let(:els) do
        ["APPLE", "cool", "e"]
      end

      it "returns true" do
        els.each do |el|
          res = WordLadder::Utilities.binary_search(el, arr) { |word| word.downcase }
          expect(res).to eq(true)
        end
      end
    end

    context "el does not exist" do
      let(:arr) do
        ["aPple", "bad", "cool", "Donut", "e"]
      end

      let(:els) do
        ["Nice", "cougar", "eXciTEd"]
      end

      it "returns false" do
        els.each do |el|
          res = WordLadder::Utilities.binary_search(el, arr) { |word| word.downcase }
          expect(res).to eq(false)
        end
      end
    end
  end
end
