def sum_of_intervals(intervals)
  sorted_intervals = intervals.sort_by(&:first)
  merged_intervals = []

  sorted_intervals.each do |interval|
    if merged_intervals.empty? || merged_intervals.last.last < interval.first
      merged_intervals << interval
    else
      merged_intervals.last[1] = [merged_intervals.last.last, interval.last].max
    end
  end

  merged_intervals.map { |interval| interval.last - interval.first }.reduce(:+)
end


#Example

puts sum_of_intervals([[1, 2], [6, 10], [11, 15]]) # Output: 9
puts sum_of_intervals([[1, 4], [7, 10], [3, 5]]) # Output: 7
puts sum_of_intervals([[1, 5], [10, 20], [1, 6], [16, 19], [5, 11]]) # Output: 19
puts sum_of_intervals([[0, 20], [-100000000, 10], [30, 40]]) # Output: 100000030
