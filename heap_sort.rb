# frozen_string_literal: true

# HeapSort
# https://en.wikipedia.org/wiki/Heapsort
# ---------------------------------------
#            Average     Worst case
# Sort      O(nlogn)      O(nlogn)
#
# Space O(1)
# ---------------------------------------
#
class HeapSort
  # @param [Arrays]
  # @return [HeapSort]
  def initialize(array)
    @array = array || []
  end

  # Sort the given array.
  # @return [Array]
  def sort
    size = array.size
    return array if size <= 1

    # Build Max Heap
    (size / 2).downto(0).each do |node|
      heapify(node, size)
    end

    # Apply the Heap Sort core logic.
    (size - 1).downto(0).each do |node|
      swap(0, node)
      heapify(0, node)
    end

    array
  end

  private

  attr_accessor :array

  # Re-organise the nodes so to create a Max Heap.
  # @param [Integer]
  # @param [Integer]
  def heapify(current, limit)
    # Heapify only the nodes that are still in the tree
    while current < limit
      index = current

      # Identify left and right children.
      # In an array representation of a Heap Tree
      # Root at index 0 implies:
      # >> Left child at 2 * parent_index + 1 = left_child
      # >> Right child at 2 * parent_index + 2 = left_child + 1
      left_child = 2 * current + 1
      righ_child = left_child + 1

      # Identify if the current node is still greater then its children.
      # If it is not then we need to swap it with the greater of its children.
      if left_child < limit && array[left_child] > array[index]
        index = left_child
      end

      # Note that here when the statement runs array[righ_child] > array[index]
      # we are not comparing with the parent but with the left child if it is
      # greater then the parent.
      if righ_child < limit && array[righ_child] > array[index]
        index = righ_child
      end

      # Retutn if there is no need of swap.
      return if index == current

      swap(current, index)

      # Keep moving down the tree to make sure the new child (what it used to
      # be the current node) is in the right position.
      current = index
    end
  end

  # Swap nodes given their indexes.
  # @param [Integer]
  # @param [Integer]
  def swap(first, last)
    array[last], array[first] = array[first], array[last]
  end
end
