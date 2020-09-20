class Cell 

	attr_accessor :cell_address, :alive, :life

	def initialize(random_life, cell_address = [1,1])
		if random_life.even?
			alive
		else
			kill
		end
		@cell_address = cell_address
	end

    def cell_address=(value)
		@cell_address = value
	end

	def run(array_grid)
		find_neighbours(array_grid)
		under_population(array_grid)
		over_population(array_grid)
		lives_on(array_grid)
		is_born(array_grid)
	end

    #get current cell
    def current_cell_address(array_grid)
		column = @cell_address[0]
		row = @cell_address[1]
		current_cell = array_grid[column][row]
	end

	def is_dead?
		@dead == true
	end

	def is_alive?
		@dead == false
	end

	def game_symbol
		if is_dead?
			"0"
		else
			"X"
		end
	end

	def alive
		@dead = false
		@life = true
	end

	def kill
		@dead = true
		@life = false
    end
    
    #Find neighbours
	def find_neighbours(array_grid)
		neighbour_group = []
		current_cell_address = current_cell_address(array_grid).cell_address
		column = @cell_address[0] + 1
		row = @cell_address[1] + 1

		i = 0
		j = 0

		while i <= 2 do
			j = 0
			while j <= 2 do
				neighbour_group << array_grid[row - i][column - j].cell_address
				j += 1
			end
			i += 1
		end

		neighbour_group.delete(current_cell_address)
		neighbour_group
	end

    #Any live cell with fewer than two live neighbours dies, as if by underpopulation
	def under_population(array_grid)
		
		alive_neighbours_count = 0

		find_neighbours(array_grid).each do |neighbouring_cell_address|
			column = neighbouring_cell_address[0]
			row = neighbouring_cell_address[1]

			alive_neighbours_count += 1 if array_grid[column][row].is_alive? == true
		end

		current_cell_address(array_grid).kill if alive_neighbours_count <= 1
	end

    #Any live cell with more than three live neighbours dies, as if by overpopulation
	def over_population(array_grid)
		
		alive_neighbours_count = 0
		
		find_neighbours(array_grid).each do |neighbouring_cell_address|
			column = neighbouring_cell_address[0]
			row = neighbouring_cell_address[1]

			alive_neighbours_count += 1 if array_grid[column][row].is_alive? == true
		end

		current_cell_address(array_grid).kill if alive_neighbours_count >= 4
	end

    #Any live cell with two or three live neighbours lives on to the next generation
	def lives_on(array_grid)

		alive_neighbours_count = 0
		
		find_neighbours(array_grid).each do |neighbouring_cell_address|
			column = neighbouring_cell_address[0]
			row = neighbouring_cell_address[1]
			alive_neighbours_count += 1 if array_grid[column][row].is_alive? == true
		end

		if alive_neighbours_count == 2 && current_cell_address(array_grid).is_alive?
			current_cell_address(array_grid).alive
		else
			current_cell_address(array_grid).kill
		end
	end
    
    #Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction
	def is_born(array_grid)

		alive_neighbours_count = 0

		find_neighbours(array_grid).each do |neighbouring_cell_address|
			column = neighbouring_cell_address[0]
			row = neighbouring_cell_address[1]
			alive_neighbours_count += 1 if array_grid[column][row].is_alive? == true
		end

		current_cell_address(array_grid).alive if alive_neighbours_count == 3
	end
end
