require 'spec_helper'
require './game-of-life.rb'


describe GameOfLife do

	it "has a columns count" do 
		game = GameOfLife.new

		game.number_of_columns = 10

		expect(game.number_of_columns).to eq(10)
	end

	it "has a rows count" do
		game = GameOfLife.new

		game.number_of_rows = 10

		expect(game.number_of_rows).to eq(10)
	end

	it "is a size specified by the user" do
		game = GameOfLife.new({row: 10, column: 10})

		expect(game.number_of_rows).to eq(10)
		expect(game.number_of_columns).to eq(10)
	end

	it "builds columns" do
		game = GameOfLife.new({row: 10, column: 10})

		expected = 10
		
		expect(game.array_columns.size).to eq(expected)
	end

	
end



describe Cell do 

	before do
		random_life = rand(0..100)
		@game = GameOfLife.new({row: 10, column: 10})
		@cell = Cell.new(random_life)
		@grid_rows = @game.array_grid
	end

	def each_square_is_a_cell?
		

		is_a_single_cell = true

		@grid_rows.each do |row|
			row.each do |square|
				is_a_single_cell = false if square.class != Cell
			end
		end

		return is_a_single_cell
	end

	it "occupies a single square on the LifeBoard" do
		expect(each_square_is_a_cell?).to eq(true)
	end

	it "looks like 'X' when it is #alive" do
		random_life = rand(0..100)
		alive_cell = Cell.new(random_life)

		alive_cell.alive

		expect(alive_cell.game_symbol).to eq("X")
	end

	it "looks like '0' when #kill" do
		random_life = rand(0..100)
		dead_cell = Cell.new(random_life)

		dead_cell.kill

		expect(dead_cell.game_symbol).to eq("0")
	end

	it "knows its cell_address" do
		last_cell = @grid_rows[9][9]
		
		expect(last_cell.cell_address).to eq([9,9])
	end

end