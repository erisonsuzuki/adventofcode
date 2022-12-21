def part1(grid)
  counter = 0

  grid.map.with_index do |row, i|
    row.map.with_index do |number, j|
      if i == 0 || j == 0 || i == grid.length - 1 || j == grid.first.length - 1
        counter += 1
        next
      end

      column = grid.transpose[j]

      if row[(j + 1)..-1].max >= number &&
         row[0..(j - 1)].max >= number &&
         column[(i + 1)..-1].max >= number &&
         column[0..(i - 1)].max >= number
        next
      end

      counter += 1
    end
  end

  counter
end

def part2(grid)
  counter = 0

  grid.map.with_index do |row, i|
    row.map.with_index do |number, j|
      next if i == 0 || j == 0 || i == grid.length - 1 || j == grid.first.length - 1

      column = grid.transpose[j]

      trees = [].tap do |tree|
        tree << (row[(j + 1)..-1].find_index { _1 >= number } || row[(j + 1)..-1].length - 1) + 1
        tree << (row[0..(j - 1)].reverse.find_index { _1 >= number } || row[0..(j - 1)].length - 1) + 1
        tree << (column[(i + 1)..-1].find_index { _1 >= number } || column[(i + 1)..-1].length - 1) + 1
        tree << (column[0..(i - 1)].reverse.find_index { _1 >= number } || column[0..(i - 1)].length - 1) + 1
      end

      trees.inject(:*)
    end
  end
end

grid = File.readlines('2022/day-08/input.txt').map(&:chomp).map { _1.chars.map(&:to_i) }

p part1(grid)
p part2(grid).flatten.compact.max
