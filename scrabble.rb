class Scrabble
  @@letter_vals = {A: 1, B: 3,
    C: 3, D: 2, E: 1, F: 4,
    G: 2, H: 4, I: 1, J: 8,
    K: 5, L: 1, M: 3, N: 1,
    O: 1, P: 3, Q: 10, R: 1,
    S: 1, T: 1, U: 1, V: 4,
    W: 4, X: 8, Y: 4, Z: 10}

  def initialize
  end

  def self.letter_vals
    @@letter_vals
  end

  def self.score(word)
    value = 0
    unless word
      raise
    end
    word.split("").each {|l| value += @@letter_vals[l.to_sym]}
    if word.length >= 7
      value += 20
    end
    value
  end

  def self.highest_score_from(array_of_words)
    #best = 0
    word = nil
    scored = array_of_words.sort_by {|w| [self.score(w), (100-(w.length)), (-1*(array_of_words.index(w)))]}
    word = scored.last
    return word
  end
end
