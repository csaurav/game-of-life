require_relative 'cell.rb'

class GameOfLife
	# include Cell
	attr_accessor :number_of_columns, :number_of_rows, :array_grid

	def initialize(options={row: 10, column: 10})
		@number_of_rows = options[:row]
		@number_of_columns = options[:column]
		grid_array
		row_address_of_cells
	end

	def array_columns
		build_columns = Array.new
		i = 0
		while i < number_of_columns do 
			random_life = rand(0..100)
			build_columns << Cell.new(random_life)
			i += 1
		end
		build_columns
	end
	
	private
	def grid_array
		array_columns
		@array_grid = Array.new

		number_of_rows.times do 
			@array_grid << array_columns
		end
		
		@array_grid
	end

	def row_address_of_cells
		i = 0
		j = 0
		while i < @array_grid.size do
			j = 0
			while j < @array_grid[i].size do 
				@array_grid[i][j].cell_address = [i,j]
				j += 1
			end	
			i += 1
		end
		@array_grid
	end
	
end


