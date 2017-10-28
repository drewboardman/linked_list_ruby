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
end
