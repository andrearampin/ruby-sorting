# frozen_string_literal: true

# SelectionSort
# https://en.wikipedia.org/wiki/Selection_sort
# ---------------------------------------
#            Average     Worst case
# Sort        O(n^2)       O(n^2)
#
# Space O(1)
# ---------------------------------------
#
class SelectionSort
  # @param [Arrays]
  # @return [SelectionSort]
  def initialize(array)
    @array = array
  end

  # Sort the given array.
  # @return [Array]
  def sort
    limit = array.size - 1
    (0..limit).each do |index|
      min = index
      (index..limit).each do |target|
        min = target if array[min] > array[target]
      end
      array[index], array[min] = array[min], array[index]
    end
    array
  end

  private

  attr_reader :array
end
