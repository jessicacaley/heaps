class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap

  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: O(n(log(n))) where n is the number of nodes in the heap
  # Space Complexity: O(1)
  def add(key, value = key)
    heap_node = HeapNode.new(key, value)
    @store << heap_node
    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(logn) where n is the number of elements in the heap
  # Space Complexity: O(1)
  def remove()
    swap(0, @store.length - 1)
    removed = @store.pop
    heap_down(0)
    return removed.value
  end


  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"
      
    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: ?
  # Space complexity: ?
  def empty?
    raise NotImplementedError, "Method not implemented yet..."
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(logn) where n is the number of nodes in the tree
  # Space complexity: O(1)
  def heap_up(index)
    return if index == 0
    current_index = index
    parent_index = (index - 1) / 2
    
    return if @store[current_index].key > @store[parent_index].key
      
    swap(current_index, parent_index)
    heap_up(parent_index)
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    current_index = index
    left_child_index = index * 2 + 1
    right_child_index = index * 2 + 2

    return unless @store[left_child_index] # we're at the bottom of the tree (could also use length)

    if @store[right_child_index]
      if @store[left_child_index].key < @store[right_child_index].key
        swap(current_index, left_child_index)
        heap_down(left_child_index)
      else
        swap(current_index, right_child_index)
        heap_down(right_child_index)
      end
    else
      swap(current_index, left_child_index)
      return
    end
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end