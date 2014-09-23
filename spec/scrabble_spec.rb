require './scrabble'

describe Scrabble do

  describe "Scrabble" do
    it "is a class" do
      expect(Scrabble.new).to be_an_instance_of Scrabble
    end

    it "has a hash of numbers and values" do
      expect(Scrabble.letter_vals).to be_an_instance_of Hash
    end
  end

  describe "self.score(word)" do
    it "returns the score for a given word" do
      expect(Scrabble.score("TOP")).to eq 5
    end

    context "given a blank string" do
      it "returns zero" do
        expect(Scrabble.score("")).to eq 0
      end
    end

    context "given nil" do
      it "returns a method error" do
        expect { Scrabble.score(nil) }.to raise_error
      end
    end
  end

  describe "self.highest_score_from(array_of_words)" do
    it "returns the word in the array with the highest score" do
      expect(Scrabble.highest_score_from(["TOP", "FLIP", "QUEUE"])).to eq "QUEUE"
    end

    context "two words are the same value" do
      it "returns the shorter one" do
        expect(Scrabble.highest_score_from(["FLIP", "FLY", "BEARDS"])).to eq "FLY"
      end
    end

    context "a word has seven letters" do
      it "it gets a bonus" do
        expect(Scrabble.highest_score_from(["TOP", "ZIP", "WINDOWS"])).to eq "WINDOWS"
      end
    end

    context "many words have the same length and value" do
      it "returns the firs one in the list" do
        expect(Scrabble.highest_score_from(["TOP", "POT", "OPT"])).to eq "TOP"
      end
    end

  end
end
