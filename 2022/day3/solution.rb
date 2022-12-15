require 'pry'
def part1(string)
  first, second = string.chars.each_slice(string.size / 2).to_a
  score first.intersection(second).first.ord
end

def part2(array)
  score array.first.intersection(*array.pop(2)).first.ord
end

def score(char_score)
  char_score > 90 ? char_score - 96 : char_score - 38
end

lines = File.readlines('2022/day3/input.txt').map(&:chomp)

p lines.map{ part1(_1) }.sum
p lines.each_slice(3).to_a.map{ part2(_1.map(&:chars)) }.sum
