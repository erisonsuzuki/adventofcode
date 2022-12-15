require 'pry'

RSpec.describe 'day 3' do
  def part1(string)
    first, second = string.chars.each_slice(string.size / 2).to_a
    common_char = first.intersection(second).first

    score common_char.ord
  end

  def part2(array)
    first, second, third = *array.map(&:chars)
    common_char = first.intersection(second, third).first

    score common_char.ord
  end

  def score(char_score)
    char_score > 90 ? char_score - 96 : char_score - 38
  end

  it do
    [
      ['vJrwpWtwJgWrhcsFMMfFFhFp', 16],
      ['jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL', 38],
      ['PmmdzqPrVvPwwTWBwg', 42],
      ['wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn', 22],
      ['ttgJtRGJQctTZtZT', 20],
      ['CrZsJsPPZsGzwwsLwLmpwMDw', 19]
    ].map do |string, result|
      expect(part1(string)).to(eq(result))
    end

    [
      ['vJrwpWtwJgWrhcsFMMfFFhFp', 'jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL', 'PmmdzqPrVvPwwTWBwg', 18],
      ['wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn', 'ttgJtRGJQctTZtZT', 'CrZsJsPPZsGzwwsLwLmpwMDw', 52]
    ].map do |array|
      expect(part2(array.take(3))).to(eq(array.pop))
    end
  end
end
