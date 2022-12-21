# frozen_string_literal: true

require 'pry-byebug'
require_relative 'node'

# LinkedList is a non-static linear data structure
class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  # Adds a new node containing 'value' to the end of the list
  def append(value)
    if @head.nil?
      @head = Node.new(value, @tail)
    else
      return_tail.next_node = Node.new(value, @tail)
    end
  end

  # Adds a new node containing 'value' to the start of the list
  def prepend(value)
    @head = if @head.nil?
              Node.new(value, @tail)
            else
              Node.new(value, @head)
            end
  end

  # Returns the total number of nodes in the list
  def size
    size = 0
    return size if @head.nil?

    current_node = @head
    size += 1
    until current_node.next_node.nil?
      current_node = current_node.next_node
      size += 1
    end
    size
  end

  # Returns the first node in the list
  def return_head
    @head
  end

  # Returns the last node of the list
  def return_tail
    if @head.nil?
      nil
    else
      current_node = @head
      current_node = current_node.next_node until current_node.next_node.nil?
      current_node
    end
  end

  # Returns the node at the given index
  def at(index)
    current_node = @head
    index.times do
      current_node.value
      current_node = current_node.next_node
    end
    current_node
  end
end

list = LinkedList.new
list.append(3)
list.append(5)
list.append(6)
list.prepend(1)