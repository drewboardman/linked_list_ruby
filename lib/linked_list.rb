require "linked_list/version"
require 'errors'

module LinkedList
  class List
    attr_accessor :head, :tail
    def initialize(head = Node.new(nil, nil))
      @head = head
      @tail = head
    end

    def append(node)
      @tail.next_node = node
      @tail = node
      return self
    end

    def prepend(node)
      node.next_node = @head
      @head = node
    end

    def pop
      old_tail = @tail
      node_previous_to_tail = self.at(self.size - 2)
      node_previous_to_tail.next_node = nil
      @tail = node_previous_to_tail
      return old_tail
    end

    def size
      visited = []
      queue = []
      queue.insert(0, @head)
      while (!queue.empty?) do
        node = queue.pop
        visited << node unless visited.include?(node)
        if node.next_node
          queue.insert(0, node.next_node)
        end
      end
      visited.size
    end

    def at(index)
      queue = []
      queue.insert(0, @head)
      target = nil
      (index+1).times do
        begin
          node = queue.pop
          if node
            queue.insert(0, node.next_node) if node.next_node
            target = node
          else
            raise Errors::IndexError.new("requested index larger than size of list")
          end
        rescue Errors::IndexError => e
          puts("Index out of bounds: #{e.message}")
        end
      end
      target
    end
  end
end
