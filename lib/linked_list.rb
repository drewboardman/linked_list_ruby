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
  end
end
