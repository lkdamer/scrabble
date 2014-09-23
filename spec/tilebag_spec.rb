require './tilebag'

describe TileBag do
  let (:bag) {TileBag.new}
  it "is a class" do
    expect(bag.class).to eq TileBag
  end

  describe "class methods" do
    describe "##.new" do
      it "creates an instance with a collection of default tiles" do
        expect(TileBag).to respond_to :new
        expect(bag.remaining_tiles[0]).to eq :A
      end
    end
  end

  describe "instance methods" do
    describe "#draw_tiles(n)" do
      it "returns n number of random tiles" do
        expect(bag.draw_tiles(7).length).to eq 7
      end
      it "removes the tiles above from the random set" do
        expect{bag.draw_tiles(7)}.to change(bag.remaining_tiles, :length)
      end
    end

    describe "#remaining_tiles" do
      it "returns the tiles remaining in the 'bag'" do
        bag.draw_tiles(5)
        expect(bag.remaining_tiles.length).to eq 93
      end
    end
  end
end
