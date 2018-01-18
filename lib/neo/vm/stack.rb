# frozen_string_literal: true

module Neo
  module VM
    # Random-access Stack
    class Stack
      def initialize
        @items = []
      end

      def push(item)
        @items.unshift item
      end

      def pop
        @items.shift
      end

      def peek(n = 0)
        @items[n]
      end

      def empty?
        @items.empty?
      end

      def size
        @items.size
      end

      def remove(index)
        @items.delete_at index
      end

      def set(index, item)
        @items[index] = item
      end

      def to_s
        "[#{@items.map(&:to_s).join(', ')}]"
      end
    end
  end
end
