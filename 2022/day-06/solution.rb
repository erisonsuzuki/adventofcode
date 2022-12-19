def solution(string, distinct_number)
  string.chars.each_cons(distinct_number).find_index do |part|
    part.uniq.count == distinct_number
  end + distinct_number
end

text = File.read('2022/day-06/input.txt').chomp

p solution text, 4
p solution text, 14
