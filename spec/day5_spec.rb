require 'pry'

RSpec.describe 'day 5' do
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

  it 'part 1' do
    stacks = [
      %w[N Z],
      %w[D C M],
      ['P']
    ]
    moves = [
      [1, 2, 1],
      [3, 1, 3],
      [2, 2, 1],
      [1, 1, 2]
    ]
    expect(part1(stacks, moves)).to(eq('CMZ'))
  end

  it 'part 2' do
    stacks = [
      %w[N Z],
      %w[D C M],
      ['P']
    ]
    moves = [
      [1, 2, 1],
      [3, 1, 3],
      [2, 2, 1],
      [1, 1, 2]
    ]
    expect(part2(stacks, moves)).to(eq('MCD'))
  end
end
