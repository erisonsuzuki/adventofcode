RSpec.describe 'day 8' do
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

  it 'part 1' do
    grid = [
      [3, 0, 3, 7, 3],
      [2, 5, 5, 1, 2],
      [6, 5, 3, 3, 2],
      [3, 3, 5, 4, 9],
      [3, 5, 3, 9, 0]
    ]
    array = grid.flatten
    rows = grid.length
    cols = grid.first.length

    expect(part1(array, rows, cols)).to(eq(21))
  end
end
