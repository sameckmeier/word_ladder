require "spec_helper"

describe WordLadder::Dictionary do
  let!(:dictionary) { WordLadder::Dictionary.new }

  describe :exists? do
    context "word exists" do
      let(:words) do
        ["can", "ANd", "Mississippi"]
      end

      it "returns true" do
        words.each do |w|
          expect(dictionary.exists?(w)).to eq(true)
        end
      end
    end

    context "word does not exist" do
      let(:invalid_words) do
        ["canN", "xxxxxx", "Mississipi"]
      end

      it "returns false" do
        invalid_words.each do |w|
          expect(dictionary.exists?(w)).to eq(false)
        end
      end
    end
  end
end
