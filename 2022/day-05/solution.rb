def part1(stacks, moves)
  moves.each do |amount, origin, target|
    crates = [].tap do |crate|
      amount.times.each { crate << stacks[origin - 1].shift }
    end

    crates.each { stacks[target - 1].unshift(_1) }
  end

  stacks.map(&:first).join
end

def part2(stacks, moves)
  moves.each do |amount, origin, target|
    crates = stacks[origin - 1].shift(amount)
    stacks[target - 1].unshift(crates).flatten!
  end

  stacks.map(&:first).join
end

rows = File.readlines('2022/day-05/input.txt').map(&:chomp)

lines_list, moves_list = rows.slice_when { _2.empty? }.to_a
lines = [].tap do |array|
  length = lines_list.pop.split(/[^\d]/).last.to_i

  lines_list.map do |line|
    crates = line.chars.each_slice(4).map { |col| col.join.scan(/\w/).first }
    array << crates.fill(nil, crates.length, length - crates.length)
  end
end

moves = [].tap do |array|
  list = moves_list.map { |move| move.split(Regexp.union(%w[move from to])).reject(&:empty?) }
  list.drop(1).each { array << _1.map(&:to_i) }
end

p part1(lines.transpose.map(&:compact), moves)
p part2(lines.transpose.map(&:compact), moves)
