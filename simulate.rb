require_relative 'game-of-life.rb'

rows = 6
cols = 6

game = GameOfLife.new({row: rows, column: cols})

i = 0
j = 0

puts "type 'X' to exit, or hit enter to continue"
input = gets.chomp


@old_grid = []
generation_count = 0

while input != "X"
	
	lines = String.new
	display_array = Array.new

	generation_count += 1

	p "Generation: #{generation_count}"
	p "*" * 20
	i = 0
	while i < (rows - 1) do 
		j = 0
		while j < (cols - 1) do
			@old_grid = game.array_grid
			cell = game.array_grid[i][j]
			cell.run(@old_grid)
			lines << cell.game_symbol
		j += 1
		end
	i += 1

	display_array << lines.slice(lines[0...lines.size])

	lines = ""
	
	end
	puts display_array

	puts "type 'X' to exit, or hit enter to continue"
	input = gets.chomp
end