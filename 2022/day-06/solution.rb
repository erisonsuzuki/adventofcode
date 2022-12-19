def solution(string, distinct_number)
  string.chars.each_cons(distinct_number).reduce(distinct_number) do |count, part|
    return count if part.tally.values.max == 1

    count += 1
  end
end

text = File.read('2022/day-06/input.txt').chomp

p solution text, 4
p solution text, 14
