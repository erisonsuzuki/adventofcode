require 'pry'

def part1(stacks, moves)
  moves.each do |amount, origin, target|
    crates = [].tap do |crate|
      amount.times.each { crate << stacks[origin - 1].shift }
    end

    crates.each { stacks[target - 1].unshift(_1) }
  end

  stacks.map { _1.first }.join('')
end

def part2(stacks, moves)
  moves.each do |amount, origin, target|
    crates = stacks[origin - 1].shift(amount)
    stacks[target - 1].unshift(crates).flatten!
  end

  stacks.map { _1.first }.join('')
end

rows = File.readlines('2022/day-05/input.txt').map(&:chomp)

lines_list, moves_list = rows.slice_when { _2.empty? }.to_a
lines = [].tap do |array|
  length = lines_list.pop.split(/[^\d]/).last.to_i

  list = lines_list.map { |line| line.split(/\G {4}/) }.map do |line|
    crates = [].tap do |crate|
      line.each do |element|
        crate << element if element.empty?
        element.split(Regexp.union(['  ', '] ['])).collect(&:strip).each { crate << _1.gsub(/\W+/, '') }
      end
    end

    array << crates.fill('', crates.length, length - crates.length)
  end
end
moves = [].tap do |array|
  list = moves_list.map { |move| move.split(Regexp.union(%w[move from to])).reject(&:empty?) }
  list.drop(1).each { array << _1.map(&:to_i) }
end

p part1(lines.transpose.map { _1.reject(&:empty?) }, moves)
p part2(lines.transpose.map { _1.reject(&:empty?) }, moves)
