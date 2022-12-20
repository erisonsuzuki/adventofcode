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
  end.values.delete_if { _1 >= 100000 }.sum
end

lines = File.readlines('2022/day-07/input.txt').map(&:chomp)
list = lines.slice_when { _2.include?("$") }.to_a

p part1 list

__END__
$ cd /
$ ls
dir a
14848514 b.txt
8504156 c.dat
dir d
$ cd a
$ ls
dir e
29116 f
2557 g
62596 h.lst
$ cd e
$ ls
584 i
$ cd ..
$ cd ..
$ cd d
$ ls
4060174 j
8033020 d.log
5626152 d.ext
7214296 k
