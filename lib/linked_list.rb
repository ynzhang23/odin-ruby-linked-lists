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
      current_node = current_node.next_node
      return nil if current_node.nil?
    end
    current_node
  end

  # Returns true if the passed in value is in the list otherwise false
  def contains?(value)
    contain = false
    current_node = @head
    contain = true if current_node.value == value
    until current_node.next_node.nil?
      current_node = current_node.next_node
      return contain = true if current_node.value == value
    end
    contain
  end

  # Returns the index of the node containing value
  def find(value)
    index = 0
    current_node = @head
    return index if current_node.value == value

    until current_node.next_node.nil?
      current_node = current_node.next_node
      index += 1
      return index if current_node.value == value
    end
    nil
  end

  # Represent your LinkedList as strings
  def to_s
    string = ''
    current_node = @head
    until current_node.next_node.nil?
      string += "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end
    string += "( #{current_node.value} ) -> nil"
    string
  end

  # Insert a new node with the provided value at given index
  def insert_at(value, index)
    if index.zero?
      prepend(value)
      return
    elsif index >= size
      append(value)
      return
    end
    current_node = @head
    (index - 1).times do
      current_node = current_node.next_node
    end
    current_node.next_node = Node.new(value, current_node.next_node)
  end
end
