# frozen_string_literal: true

# InsertSort
# https://en.wikipedia.org/wiki/Insertion_sort
# ---------------------------------------
#            Average     Worst case
# Sort        O(n^2)       O(n^2)
#
# Space O(1)
# ---------------------------------------
#
class InsertSort
  # @param [Arrays]
  # @return [InsertSort]
  def initialize(array)
    @array = array
  end

  # Sort the given array.
  # @return [Array]
  def sort
    1.upto(array.size - 1).each do |index|
      current = index
      while current.positive?
        break unless array[current] < array[current - 1]

        array[current], array[current - 1] = array[current - 1], array[current]
        current -= 1
      end
    end
    array
  end

  private

  attr_reader :array
end
