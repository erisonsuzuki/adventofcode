def part1(chars)
  score chars.each_slice(chars.size / 2).inject(:&).first.ord
end

def part2(chars_list)
  score chars_list.inject(:&).first.ord
end

def score(char_score)
  char_score > 90 ? char_score - 96 : char_score - 38
end

lines = File.readlines('2022/day-03/input.txt').map(&:chomp)

p lines.map { part1(_1.chars) }.sum
p lines.each_slice(3).map { part2(_1.map(&:chars)) }.sum
