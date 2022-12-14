def part1(calories)
  calories.map { _1.map(&:to_i).sum }.max
end

def part2(calories)
  calories.map { _1.map(&:to_i).sum }.max(3).sum
end

calories = File.readlines('input.txt').map(&:chomp).slice_when { _2.empty? }.to_a

p part1 calories
p part2 calories
