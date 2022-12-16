def part1(left, right)
  left.cover?(right) || right.cover?(left)
end

def part2(left, right)
  left.to_a.intersect? right.to_a
end

lines = File.readlines('2022/day-04/input.txt').map(&:chomp)
pairs = lines.map do
  _1.split(Regexp.union(%w[, -])).each_slice(2).to_a
    .map { |pair| Range.new(*pair) }
end

p pairs.map { part1(*_1) }.count(true)
p pairs.reduce(0) { |count, pair| part2(*pair) ? count + 1 : count }
