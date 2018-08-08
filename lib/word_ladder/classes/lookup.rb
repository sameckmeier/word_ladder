module WordLadder
  class Lookup
    def initialize(keys)
      @lookup = keys.length > 0 ? build(keys) : []
    end

    def exists?(key)
      @lookup[format_key(key)] == true
    end

    def add(key)
      @lookup[format_key(key)] = true
    end

    private

    def format_key(key)
      key.downcase.to_sym
    end

    def build(keys)
      keys.each_with_object({}) do |key, hsh|
        hsh[format_key(key)] = true
        hsh
      end
    end
  end
end
