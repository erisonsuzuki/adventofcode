RSpec.describe 'day 7' do
  before(:all) do
    @lines = DATA.readlines.map(&:chomp)
  end

  def part1(commands)
    dirs = []
    {'/' => 0}.tap do |hash|
      commands.each do |row|
        command, dir = row.shift.split(" ").drop(1)

        case command
        when 'cd'
          dir != '..' ? dirs << dir : dirs.pop
        when 'ls'
          row.map { _1.split(" ") }.each do |first, second|
            if first == 'dir'
              hash[second] = 0 unless hash[second]
            else
              dirs.each { hash[_1] += first.to_i }
            end
          end
        end
      end
    end
  end

  it 'part 1' do
    list = @lines.slice_when { _2.include?("$") }.to_a
    result = part1(list)

    [
      ['e', 584],
      ['a', 94853],
      ['d', 24933642],
      ['/', 48381165],
    ].each do |directory, amount|
      expect(result[directory]).to(eq(amount))
    end
  end
end

__END__
- / (dir)
  - a (dir)
    - e (dir)
      - i (file, size=584)
    - f (file, size=29116)
    - g (file, size=2557)
    - h.lst (file, size=62596)
  - b.txt (file, size=14848514)
  - c.dat (file, size=8504156)
  - d (dir)
    - j (file, size=4060174)
    - d.log (file, size=8033020)
    - d.ext (file, size=5626152)
    - k (file, size=7214296)
