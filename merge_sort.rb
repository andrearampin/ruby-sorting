# frozen_string_literal: true

# MergeSort
# https://en.wikipedia.org/wiki/Merge_sort
# ---------------------------------------
#            Average     Worst case
# Sort       O(nlogn)      O(nlogn)
#
# Space O(n)
# ---------------------------------------
#
class MergeSort
  # @param [Arrays]
  # @return [MergeSort]
  def initialize(array)
    @array = array
  end

  # Sort the given array.
  # @return [Array]
  def sort
    recursive_sort(array)
  end

  private

  attr_reader :array

  # Recursively split the unsorted array in two and then merge the two parts.
  # @param [Array]
  # @return [Array]
  def recursive_sort(array = [])
    size = array.size
    return array if size <= 1

    left = recursive_sort(array.slice(0, size / 2))
    right = recursive_sort(array.slice(size / 2, size))
    merge(left, right)
  end

  # Merge the two unsorted lists.
  # Remember that [1] and [] are sorted.
  # @param [Array]
  # @param [Array]
  # @return [Array]
  def merge(left, right)
    # [] [1]
    return left if right.empty?

    # [3] []
    return right if left.empty?

    # [2, 6, 8, 11] [15, 28, 20]
    return left + right if left.last <= right.first

    # [2, 6, 8, 11] [3, 5, 9]
    output = []
    while right.any? && left.any?
      output << if right.first > left.first
                  left.shift
                else
                  right.shift
                end
    end
    output + right + left
  end
end
