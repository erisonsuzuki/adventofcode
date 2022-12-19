RSpec.describe 'day 6' do
  def part1(string, distinct_number)
    string.chars.each_cons(distinct_number).reduce(distinct_number) do |count, part|
      return count if part.tally.values.max == 1

      count += 1
    end
  end

  it 'part 1' do
    [
      ['bvwbjplbgvbhsrlpgdmjqwftvncz', 5],
      ['nppdvjthqldpwncqszvftbrmjlhg', 6],
      ['nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg', 10],
      ['zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw', 11]
    ].each do |string, result|
      expect(part1(string, 4)).to(eq(result))
    end
  end

  it 'part 2' do
    [
      ['mjqjpqmgbljsphdztnvjfqwrcgsmlb', 19],
      ['bvwbjplbgvbhsrlpgdmjqwftvncz', 23],
      ['nppdvjthqldpwncqszvftbrmjlhg', 23],
      ['nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg', 29],
      ['zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw', 26]
    ].each do |string, result|
      expect(part1(string, 14)).to(eq(result))
    end
  end
end
