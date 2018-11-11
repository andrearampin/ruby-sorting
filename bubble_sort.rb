# frozen_string_literal: true

# BubbleSort
# https://en.wikipedia.org/wiki/Bubble_sort
# ---------------------------------------
#            Average     Worst case
# Sort        O(n^2)       O(n^2)
#
# Space O(1)
# ---------------------------------------
#
class BubbleSort
  # @param [Arrays]
  # @return [BubbleSort]
  def initialize(array)
    @array = array
  end

  # Sort the given array.
  # @return [Array]
  def sort
    limit = array.size
    while limit.positive?
      0.upto(limit).each do |index|
        next if array[index + 1].nil?
        next unless array[index] > array[index + 1]

        array[index], array[index + 1] = array[index + 1], array[index]
      end
      limit -= 1
    end
    array
  end

  private

  attr_accessor :array
end
