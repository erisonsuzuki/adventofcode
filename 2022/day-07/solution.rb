def create_directories(commands)
  cwd = []
  directories = Hash.new { |h, k| h[k] = 0 }

  commands.each do |row|
    command, dir = row.shift.split(' ').drop(1)

    case command
    when 'cd'
      dir != '..' ? cwd << dir : cwd.pop
    when 'ls'
      row.map { _1.split(' ') }.each do |args|
        next unless args[0] != 'dir'

        cwd.length.times do |x|
          directories[cwd[0..x]] += args[0].to_i
        end
      end
    end
  end

  directories
end

def part1(commands)
  create_directories(commands).values.select { _1 <= 100_000 }.sum
end

def part2(commands)
  directories = create_directories(commands)
  necessary_space = 30_000_000 - (70_000_000 - directories[['/']])

  directories.values.select { _1 >= necessary_space }.min
end

lines = File.readlines('2022/day-07/input.txt').map(&:chomp)

p part1 lines.slice_when { _2.include?('$') }.to_a
p part2 lines.slice_when { _2.include?('$') }.to_a
