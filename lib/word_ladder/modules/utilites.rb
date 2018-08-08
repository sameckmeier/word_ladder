module WordLadder
  module Utilities
    class << self
      def binary_search(el, arr, &block)
        return false if arr.empty?

        i = (arr.length - 1) / 2.0.floor
        a = block.call(el)
        b = block.call(arr[i])

        if a == b
          true
        elsif arr.length == 1
          false
        elsif a > b
          binary_search(el, arr[i+1..-1], &block)
        else
          binary_search(el, arr[0...i], &block)
        end
      end
    end
  end
end
