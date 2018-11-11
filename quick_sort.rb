# frozen_string_literal: true

# QuickSort
# https://en.wikipedia.org/wiki/Quicksort
# ---------------------------------------
#            Average     Worst case
# Sort       O(nlogn)      O(n^2)
#
# Space O(nlogn)
# ---------------------------------------
#
class QuickSort
  # @param [Arrays]
  # @return [QuickSort]
  def initialize(array)
    @array = array
  end

  # Sort the given array.
  # @return [Array]
  def sort
    recursive_sort(array)
  end

  private

  attr_accessor :array

  # Pick a pivot and use it to split/sort the elements in the unsorted array.
  # @param [Array]
  # @return [Array]
  def recursive_sort(array = [])
    size = array.size
    return array if size <= 1

    pivot = array.delete_at(rand(size - 1))
    left = []
    right = []
    array.each do |element|
      if element < pivot
        right << element
      else
        left << element
      end
    end

    recursive_sort(right) + [pivot] + recursive_sort(left)
  end
end
