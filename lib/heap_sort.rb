require_relative "min_heap"

# This method uses a heap to sort an array.
# Time Complexity:  ?
# Space Complexity: ?
def heapsort(list)
  return list if list == [] || list.length == 1

  # initialize new heap
  heap = MinHeap.new

  # add each element in list to heap's store
  list.each do |num|
    key = num
    value = num

    heap.add(key, value)
  end

  sorted_list = []
  # take each element out of heap's store, keep it in another array
  list.length.times do
    removed = heap.remove
    sorted_list << removed
  end

  return sorted_list
end
