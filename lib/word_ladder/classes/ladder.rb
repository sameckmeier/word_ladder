module WordLadder
  class Ladder
    Wle = Struct.new(:word, :path)

    class << self
      def run(a, b)
        new(a, b).run
      rescue InvalidWordError => e
        puts e.message
      end
    end

    def initialize(a, b)
      dictionary = Dictionary.new
      [a, b].each { |word| dictionary.exists?(word, true) }

      @initial_word = Word.new(a, dictionary)
      @end = b
    end

    def run
      return [] if @initial_word.key == @end || @initial_word.key.length != @end.length
      todos = wles(@initial_word)
      process_words(todos, Lookup.new([@initial_word.key]))
    end

    private

    def process_words(todos, visited)
      return [] if todos.empty?

      try = todos.find { |todo| @end == todo.word.key }

      if try
        try.path
      else
        process_words(
          next_todos(todos, visited),
          visited
        )
      end
    end

    def next_todos(todos, visited)
      todos.each_with_object([]) do |todo, arr|
        word = todo.word
        path = todo.path

        if visited.exists?(word.key)
          arr
        else
          visited.add(word.key)
          arr.concat(wles(word, path))
        end
      end
    end

    def wles(word, path = [])
      path << word.key if path.length == 0
      word.next_words.map { |w| Wle.new(w, path + [w.key]) }
    end
  end
end
