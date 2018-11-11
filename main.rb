# frozen_string_literal: true

require_relative 'bubble_sort'
require_relative 'insert_sort'
require_relative 'selection_sort'
require_relative 'merge_sort'
require_relative 'quick_sort'
require_relative 'heap_sort'
# require_relative 'radix_sort'
require 'benchmark'
require 'byebug'

array = [8, 2, 16, 3, 9, 1, 3, 20, 7, 19, 5, 101, 3, 17]
puts "Unsorted:   #{array}"

puts "\nBubbleSort"
puts "Output: #{BubbleSort.new(array.dup).sort}"
tmp_array = array.dup
puts "Performance: #{Benchmark.measure { BubbleSort.new(tmp_array).sort }}\n"

puts "\nInsertSort"
puts "Output: #{InsertSort.new(array.dup).sort}"
tmp_array = array.dup
puts "Performance: #{Benchmark.measure { InsertSort.new(tmp_array).sort }}\n"

puts "\nSelectionSort"
puts "Output: #{SelectionSort.new(array.dup).sort}"
tmp_array = array.dup
puts "Performance: #{Benchmark.measure { SelectionSort.new(tmp_array).sort }}\n"

puts "\nMergeSort"
puts "Output: #{MergeSort.new(array.dup).sort}"
tmp_array = array.dup
puts "Performance: #{Benchmark.measure { MergeSort.new(tmp_array).sort }}\n"

puts "\nQuickSort"
puts "Output: #{QuickSort.new(array.dup).sort}"
tmp_array = array.dup
puts "Performance: #{Benchmark.measure { QuickSort.new(tmp_array).sort }}\n"

puts "\nHeapSort"
puts "Output: #{HeapSort.new(array.dup).sort}"
tmp_array = array.dup
puts "Performance: #{Benchmark.measure { HeapSort.new(tmp_array).sort }}\n"

# puts "\nRadixSort"
# puts "Output: #{RadixSort.new(array.dup).sort}"
# tmp_array = array.dup
# puts "Performance: #{Benchmark.measure { RadixSort.new(tmp_array).sort }}\n"
