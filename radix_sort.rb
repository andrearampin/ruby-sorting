# frozen_string_literal: true

# RadixSort
# https://en.wikipedia.org/wiki/Radix_sort
# ---------------------------------------
#            Average     Worst case
# Sort       O(kN)        O(kN)
#
# Space O(k + N)
# ---------------------------------------
#
class RadixSort
  # @param [Arrays]
  # @param [Integer]
  # @return [RadixSort]
  def initialize(array, base = 10)
    @array = array || []
    @base = base
  end

  # Sort the given array.
  # @return [Array]
  def sort
    size = array.size
    return array if size <= 1

    # Number of digits needed to represent the max number in the array.
    digits = (Math.log(array.max, base) + 1).floor.to_i

    output = array
    (0..digits - 1).each do |index|
      output = counting_sort(output, index)
    end

    output
  end

  private

  attr_accessor :array, :base

  # Sort a list of integer using the coutnring sort logic
  # @param [Array]
  # @param [Integer]
  # @return [Array]
  def counting_sort(unsorted, digit)
    sorted = Array.new(unsorted.size - 1, 0)
    buckets = Array.new(base, 0)

    # Counts the number of occurences of each digit in the list.
    (0..unsorted.size - 1).each do |index|
      digit_at_index = (unsorted[index] / base**digit) % base
      buckets[digit_at_index] += 1
    end

    # Cumulative # of digits up to that index.
    (1..base - 1).each do |index|
      buckets[index] += buckets[index - 1]
    end

    # Use the counting sorting array properties to sort the item for the
    # given digit.
    (unsorted.size - 1).downto(0).each do |index|
        digit_at_index = (unsorted[index] / base**digit) % base
      buckets[digit_at_index] -= 1
      sorted[buckets[digit_at_index]] = unsorted[index]
    end

    sorted
  end
end
