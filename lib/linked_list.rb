require "linked_list/version"

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
    end

    def prepend(node)
      node.next_node = @head
      @head = node
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
  end
end
