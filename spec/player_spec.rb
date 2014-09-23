require './player'

describe Player do
  let (:bob) {Player.new("Bob")}
  it "is a class" do
    expect(bob).to be_an_instance_of Player
  end

  describe "instance methods" do
    describe "#name" do
      it "returns the player's name" do
        expect(bob.name).to eq "Bob"
      end
    end

    describe "#total_score" do
      it "returns a player's total score" do
        expect(bob.total_score).to eq 0
      end
    end

    describe "#won" do
      it "returns true if the player has over 100 points" do
        bob.play("ZQYAKJARZZZZA")
        expect(bob.won).to eq true
      end

      context "when the player has 100 points or fewer" do
        it "returns nil" do
          expect(bob.won).to eq nil
        end
      end
    end

    describe "#plays" do
      it "returns an array of the words played by the player" do
        expect(bob.plays).to eq []
      end
    end

    describe "#play(word)" do
      it "adds the word to the plays array" do
        expect {bob.play("POOP")}.to change(bob, :plays)
      end

      context "when the player has won" do
        it "returns false" do
          bob.play("ZQYAKJARZZZZA")
          expect(bob.play("POT")).to eq false
        end
      end
    end

    describe "#highest_scoring_word" do
      it "returns the highest scoring word the player has played" do
        bob.play("FLIP")
        bob.play("QUINT")
        expect(bob.highest_scoring_word).to eq "QUINT"
      end
    end

    describe "#highest_word_score" do
      it "returns score of highest scoring word" do
        bob.play("FLIP")
        bob.play("QUINT")
        expect(bob.highest_word_score).to eq 14
      end
    end

    describe "#hmmm" do
      it "putses a player's thought process" do
        expect(bob.hmmm).to eq "I could.... Or.... Hmmm.\nOr maybe I should..."
      end
    end

    describe "#tiles" do
      it "is a collection of letters that the player can play" do
        expect(bob.tiles).to eq []
      end

      context "if #tiles has more than 7 elements" do
        it "raises an error" do
          expect{ bob.tiles = 8 }.to raise_error
        end
      end
    end

    # describe "#draw_tiles(tile_bag)" do
    #   it "draws tiles from a tile_bag instance" do
    #     expect(bob.draw_tiles(TileBag.new))
    #   end
    # end
  end
end
