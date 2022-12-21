def part1(array, rows, cols)
  counter = 0

  array.each_with_index do |number, index|
    # each on the edge
    if [0, rows - 1].include?(index / cols) || [0, cols - 1].include?(index % cols)
      counter += 1
      next
    end

    # find from the directions
    if Range.new(1, cols - 1 - (index % cols)).to_a.find { |i| array[index + i] >= number } &&
       Range.new(1, index % cols).to_a.find { |i| array[index - i] >= number } &&
       Range.new(1, (index / cols)).to_a.find { |i| array[index - (rows * i)] >= number } &&
       Range.new(1, cols - 1 - (index / cols)).to_a.find { |i| array[index + (rows * i)] >= number }
      next
    end

    counter += 1
  end

  counter
end

grid = File.readlines('2022/day-08/input.txt').map(&:chomp).map { _1.chars.map(&:to_i) }
array = grid.flatten
rows = grid.length
cols = grid.first.length

p part1(array, rows, cols)
