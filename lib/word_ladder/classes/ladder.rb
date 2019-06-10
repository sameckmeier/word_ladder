module WordLadder
  class Ladder
    Node = Struct.new(:key, :word, :path)

    class << self
      def run(a, b)
        new(a, b).run
      rescue InvalidWordError => e
        puts e.message
      end
    end

    def initialize(a, b)
      dictionary = Dictionary.new

      dictionary.exists?(a, true)
      dictionary.exists?(b, true)

      @initial_word = Word.new(a, dictionary)
      @visited = Lookup.new([@initial_word.key])
      @end = b
    end

    def run
      return if @initial_word.key.length != @end.length
      node = Node.new(@initial_word.key, @initial_word, [@initial_word.key])
      @todos = next_nodes(node)
      word_path(node)
    end

    private

    def word_path(node)
      while !@todos.empty?
        return node.path if @end == node.key

        node = @todos.shift
        unless @visited.exists?(node.key)
          @todos.concat(next_nodes(node))
          @visited.add(node.key)
        end
      end
    end

    def next_nodes(node)
      word = node.word
      path = node.path
      word.next_words.map { |w| Node.new(w.key, w, path + [w.key]) }
    end
  end
end
