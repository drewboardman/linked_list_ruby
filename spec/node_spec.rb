require 'spec_helper'
require 'node'

RSpec.describe Node do
  it 'creates a Node' do
    node = Node.new(1)
    expect(node.value).to eq(1)
    expect(node.next_node).to eq(nil)
  end

  it 'can update next_node' do
    node = Node.new(1)
    node.next_node = Node.new(4)
    expect(node.next_node.value).to eq(4)
    expect(node.next_node.next_node).to eq(nil)
  end
end
