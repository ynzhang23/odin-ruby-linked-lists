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

  # Returns the last node of the list
  def last
    if @head.nil?
      nil
    else
      current_node = @head
      until current_node.next_node.nil?
        current_node = current_node.next_node
      end
      current_node
    end
  end

  # Adds a new node containing 'value' to the end of the list
  def append(value)
    if @head.nil?
      @head = Node.new(value, @tail)
    else
      last.next_node = Node.new(value, @tail)
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
  end
end

list = LinkedList.new
list.append(3)
list.append(5)
list.append(6)
list.prepend(1)