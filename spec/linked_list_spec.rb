require "spec_helper"
require 'node'

RSpec.describe LinkedList do
  it "has a version number" do
    expect(LinkedList::VERSION).not_to be nil
  end

  it 'set the head and tail to the same node' do
    node = Node.new(8, nil)
    list = LinkedList::List.new(node)
    expect(list.head).to eq(node)
    expect(list.tail).to eq(node)
  end

  describe '#append' do
    it 'adds a new node to the end of the list' do
      node_1 = Node.new(1,nil)
      node_2 = Node.new(4,nil)
      list = LinkedList::List.new(node_1)
      list.append(node_2)
      expect(list.tail).to eq(node_2)
      expect(list.head.next_node).to eq(node_2)
    end
  end

  describe '#prepend' do
    it 'adds the node to the front of the list' do
      node_1 = Node.new(4)
      node_2 = Node.new(15)
      list = LinkedList::List.new(node_1)
      list.prepend(node_2)
      expect(list.head).to eq(node_2)
      expect(list.tail).to eq(node_1)
      expect(list.head.next_node).to eq(node_1)
    end
  end

  describe '#size' do
    it 'returns the size of the list' do
      node_1 = Node.new(4)
      node_2 = Node.new(15)
      list = LinkedList::List.new(node_1)
      list.append(node_2)
      expect(list.size).to eq(2)
    end
  end

  describe '#at' do
    it 'returns the node at the given index' do
      node_1 = Node.new(4)
      node_2 = Node.new(15)
      node_3 = Node.new(6)
      list = LinkedList::List.new(node_1)
      list.append(node_2).append(node_3)
      expect(list.at(0)).to be(node_1)
      expect(list.at(1)).to be(node_2)
      expect(list.at(2)).to be(node_3)
    end
  end

  describe '#pop' do
    it 'removes the last node in the linked list' do
      node_1 = Node.new(4)
      node_2 = Node.new(15)
      node_3 = Node.new(6)
      list = LinkedList::List.new(node_1)
      list.append(node_2).append(node_3)
      list.pop
      expect(list.tail).to eq(node_2)
      expect(list.tail.next_node).to eq(nil)
    end

    it 'returns current tail like array.pop' do
      node_1 = Node.new(4)
      node_2 = Node.new(15)
      node_3 = Node.new(6)
      list = LinkedList::List.new(node_1)
      list.append(node_2).append(node_3)
      popped = list.pop
      expect(popped).to eq(node_3)
    end
  end
end
