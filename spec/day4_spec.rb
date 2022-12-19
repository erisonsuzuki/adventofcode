require 'pry'

RSpec.describe 'day 4' do
  def part1(first, second)
    left = (first[0]..first[1]).to_a
    right = (second[0]..second[1]).to_a
    intersect = (left & right).size

    intersect == left.size || intersect == right.size
  end

  def part2(first, second)
    left = (first[0]..first[-1]).to_a
    right = (second[0]..second[-1]).to_a

    (left & right).any?
  end

  it do
    array = [
      ['2-4', '6-8', false],
      ['2-3', '4-5', false],
      ['5-7', '7-9', false],
      ['2-8', '3-7', true],
      ['6-6', '4-6', true],
      ['2-6', '4-8', false]
    ].map do |left, right, _result|
      expect(part1(left.split('-'), right.split('-'))).to(eq(_result))
    end

    array = [
      ['2-4', '6-8', false],
      ['2-3', '4-5', false],
      ['5-7', '7-9', true],
      ['2-8', '3-7', true],
      ['6-6', '4-6', true],
      ['2-6', '4-8', true]
    ].map do |left, right, _result|
      expect(part2(left.split('-'), right.split('-'))).to(eq(_result))
    end
  end
end
