require "spec_helper"

describe WordLadder::Word do
  describe :next_words do
    let(:dictionary) { WordLadder::Dictionary.new }
    let(:word) { WordLadder::Word.new(key, dictionary) }

    context "invalid word" do
      let(:key) { "qwerty" }

      it "throws InvalidWordError" do
        expect { word }.to raise_error WordLadder::InvalidWordError
      end
    end

    context "has no valid next words" do
      let(:key) { "mississippi" }

      it "returns empty array" do
        expect(word.next_words).to eq([])
      end
    end

    context "has valid next words" do
      let(:key) { "it" }

      it "returns array of Word" do
        expected = ["at", "id", "ie", "if", "in", "io", "is", "st", "ut"]
        expect(word.next_words.map(&:key)).to eq(expected)
      end
    end
  end
end
