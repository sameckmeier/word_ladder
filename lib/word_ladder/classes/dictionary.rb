module WordLadder
  class Dictionary
    DICT_PATH = "/usr/share/dict/words"
    DICT_FILE_MODE = "r"

    def initialize
      build
    end

    def exists?(word)
      @lookup.exists?(word)
    end

    def validate_word(word)
      fail InvalidWordError, "#{word} is not a real word" unless exists?(word)
    end

    private

    def build
      words = File.open(DICT_PATH, DICT_FILE_MODE) { |file| file.read.split("\n") }
      @lookup = Lookup.new(words)
    end
  end
end
