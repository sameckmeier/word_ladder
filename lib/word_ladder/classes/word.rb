module WordLadder
  class Word
    attr_reader :key, :dictionary

    def initialize(word, dictionary)
      @key = word.downcase
      @dictionary = dictionary

      dictionary.validate_word(word)
    end

    def next_words
      @next_words ||= gen_next_words.sort { |a, b| a.key <=> b.key }
    end

    private

    def gen_next_words
      (0...key.length).each_with_object([]) do |i, arr|
        arr.concat(valid_words(i).map { |w| self.class.new(w, dictionary) })
      end
    end

    def valid_words(i)
      words(i).keep_if { |w| dictionary.exists?(w) && w.downcase != key }
    end

    def words(i)
      letters.map do |l|
        word = key.clone
        word[i] = l
        word
      end
    end

    def letters
      ("a".."z").to_a
    end
  end
end
