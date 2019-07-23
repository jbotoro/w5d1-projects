class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    @prev.next = @next
    @next.prev = @prev
    @next = nil
    @prev = nil
  end
end

class LinkedList
  def initialize
    @head = Node.new(:first, nil)
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail && @tail.prev == @head
  end

  def get(key)
  end

  def include?(key)
  end

  def append(key, val)
    left = @tail.prev
    middle = Node.new(key,val)
    right = @tail
    
    left.next = middle
    middle.next = right
    middle.prev = left
    right.prev = middle
    
    # new_node.next = @head.next
    # new_node.prev = @head
    # new_node.next.prev = new_node
    # @head.next = new_node.next
    

  end

  def update(key, val)
  end

  def remove(key)
  end

  def each
    current_node = first
    #node_vals = []
    until current_node.next == @tail
      yield(current_node)
      #node_vals << current_node.val
      #current_node = current_node.next
    end
    #node_vals
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
