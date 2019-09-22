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
    new_node = HeapNode.new(key, value)
    @store << new_node

    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: ?
  # Space Complexity: ?
  def remove()
    root = @store[0]
    new_root = @store[@store.length - 1]

    @store[@store.length - 1] = root
    @store[0] = new_root

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
    return true if @store == []
    return false
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

    swap(parent_index, index)

    # call recursively on child's new position
    heap_up(parent_index)
  end

  # This helper method takes an index and
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    left_child = 2 * index + 1
    right_child = 2 * index + 2
    min_child = nil

    # Return if there's no left child
    return if left_child > @store.length - 1

    # If there's no RIGHT child AND parent is greater than LEFT child...
    # swap parent with left child
    if @store[right_child].nil? && @store[index].key > @store[left_child].key
      swap(index, left_child)
      heap_down(index)
    end

    # Otherwise, which child is min?
    if @store[right_child].key <= @store[left_child].key
      min_child = @store.index(@store[right_child])
    else
      min_child = @store.index(@store[left_child])
    end

    # If parent is greater than minimum child, swap them
    if @store[index].key > @store[min_child].key
      swap(index, min_child)
      heap_down(index)
    end
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end
