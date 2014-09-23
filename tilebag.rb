require_relative 'scrabble'

class TileBag
  def initialize
    populate_tiles
  end

  def populate_tiles
    @tiles = Array.new(9, :A) + Array.new(2, :B) + Array.new(2, :C) +
    Array.new(4, :D) + Array.new(12, :E) + Array.new(2, :F) + Array.new(3, :G) +
    Array.new(2, :H) + Array.new(9, :I) + Array.new(1, :J) + Array.new(1, :K) +
    Array.new(4, :L) + Array.new(2, :M) + Array.new(6, :N) + Array.new(8, :O) +
    Array.new(2, :P) + Array.new(1, :Q) + Array.new(6, :R) + Array.new(4, :S) +
    Array.new(6, :T) + Array.new(4, :U) + Array.new(2, :V) + Array.new(2, :W) +
    Array.new(1, :X) + Array.new(2, :Y) + Array.new(1, :Z)
  end

  def draw_tiles(n)
    results = []
    n.times { results << @tiles.shuffle!.pop }
    results
  end

  def remaining_tiles
    @tiles
  end

end
