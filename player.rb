require_relative 'scrabble'

class Player
  def initialize(name)
    @name = name
    @words = []
    @tiles = []
  end

  def name
    @name
  end

  def total_score
    score = 0
    @words.each {|w| score += Scrabble.score(w)}
    score
  end

  def won
    if total_score > 100
      true
    end
  end

  def plays
    @words
  end

  def play(word)
    if won
      false
    else
      @words << word
    end
  end

  def highest_scoring_word
    Scrabble.highest_score_from(@words)
  end

  def highest_word_score
    Scrabble.score(highest_scoring_word)
  end

  def hmmm
    "I could.... Or.... Hmmm.\nOr maybe I should..."
  end

  def tiles
    if @tiles.length > 7
      raise Error
    end
    @tiles
  end
end
