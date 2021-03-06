require "spec_helper"

describe WordLadder::Ladder do
  describe :new do
    context "invalid words" do
      it do
        expect { WordLadder::Ladder.new("xxxx", "cool") }
          .to raise_error WordLadder::InvalidWordError
      end

      it do
        expect { WordLadder::Ladder.new("cool", "xxxx") }
          .to raise_error WordLadder::InvalidWordError
      end

      it do
        expect { WordLadder::Ladder.new("xxxx", "xxxx") }
          .to raise_error WordLadder::InvalidWordError
      end

      it do
        expect { WordLadder::Ladder.new("cool", "nice") }
          .to_not raise_error
      end
    end
  end

  describe :run do
    context "valid words" do
      it { expect(WordLadder::Ladder.run("fan", "fan")).to eq ["fan"] }
      it { expect(WordLadder::Ladder.run("fan", "fanny")).to eq nil }
      it { expect(WordLadder::Ladder.run("animal", "little")).to eq nil }
      it { expect(WordLadder::Ladder.run("fan", "pan")).to eq ["fan", "pan"] }
      it { expect(WordLadder::Ladder.run("code", "data")).to eq ["code", "cade", "cate", "date", "data"] }
      it { expect(WordLadder::Ladder.run("graded", "loaded")).to eq ["graded", "grader", "trader", "toader", "loader", "loaded"] }
    end
  end
end
