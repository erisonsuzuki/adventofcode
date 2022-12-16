require 'pry'

def part1(first, second)
  left = (first[0]..first[1]).to_a
  right = (second[0]..second[1]).to_a
  intersect = (left & right).size

  intersect == left.size || intersect == right.size
end

def part2(first, second)
  left = (first[0]..first[1]).to_a
  right = (second[0]..second[1]).to_a

  (left & right).any?
end

lines = File.readlines('2022/day-04/input.txt').map(&:chomp)
pairs = lines.map { _1.split(Regexp.union(%w(, -))).each_slice(2).to_a }

p pairs.map { part1(*_1) }.count(true)
p pairs.map { part2(*_1) }.count(true)
