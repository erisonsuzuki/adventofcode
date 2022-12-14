def part1(opponent, me)
  opponent_index = %w(a b c).index(opponent.downcase)
  me_index = %w(x y z).index(me.downcase)

  score = 0
  if opponent_index == me_index
    score = 3
  elsif opponent_index + 1 == me_index || opponent_index == me_index + 2
    score = 6
  end

  score + me_index + 1
end

def part2(opponent, me)
  opponent_index = %w(a b c).index(opponent.downcase)
  me_options = %w(x y z)

  case me.downcase
  when 'x'
    1 + me_options.index(me_options[opponent_index - 1] || 'z')
  when 'z'
    1 + me_options.index(me_options[opponent_index + 1] || 'x') + 6
  else
    1 + opponent_index + 3
  end
end

lines = File.readlines('2022/day2/input.txt').map(&:chomp).map{ _1.split(" ") }

p lines.map { part1(*_1) }.sum
p lines.map { part2(*_1) }.sum
