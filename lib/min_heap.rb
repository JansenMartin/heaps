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
  # Time Complexity: ?
  # Space Complexity: ?
  def add(key, value = key)
    # raise NotImplementedError, "Method not implemented yet..."
    new_node = HeapNode.new(key, value)
    @store << new_node

    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: ?
  # Space Complexity: ?
  def remove()
    raise NotImplementedError, "Method not implemented yet..."
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
  # Time complexit`y: ?
  # Space complexity: ?
  def heap_up(index)
    parent_index = (index - 1) / 2 # get parent index based on child's position

    # return the array if there's no parent, or parent is less than or equal to child
    return @store if parent_index < 0 || @store[index].key >= @store[parent_index].key

    # temporarily storing parent
    parent_temp = @store[parent_index]
    # child is now in parent's index
    @store[parent_index] = @store[index]
    # parent is now in child's former position
    @store[index] = parent_temp

    # call recursively on child's new position
    heap_up(parent_index)
  end

  # This helper method takes an index and
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    raise NotImplementedError, "Method not implemented yet..."
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end
