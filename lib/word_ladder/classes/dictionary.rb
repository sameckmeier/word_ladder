module WordLadder
  class Dictionary
    DICT_PATH = "/usr/share/dict/words"
    DICT_FILE_MODE = "r"

    def initialize
      build
    end

    def exists?(word, raise_error = false)
      exists = @lookup.exists?(word)

      fail InvalidWordError, "#{word} is not a real word" if
        raise_error && !exists

      exists
    end

    private

    def build
      words = File.open(DICT_PATH, DICT_FILE_MODE) { |file| file.read.split("\n") }
      @lookup = Lookup.new(words)
    end
  end
end
