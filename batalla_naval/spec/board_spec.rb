require 'rspec'
require_relative '../model/board.rb'
require_relative '../model/ships.rb'

describe 'a Board' do

	before (:each) do
		@board = Board.new 6, 7
	end

	it 'Should create a Board successfully' do
		expect(@board).to be_an_instance_of(Board)
	end

	it 'Should create a SmallShip in x => 2, y => 3' do
		@board.create_small_ship 2, 3
		expect(@board.is_occupied?(2,3)).to eq(true)
	end

	it 'Should create a large ship in x => 4, y => 5.' do
		@board.create_large_ship 4, 5
		expect(@board.is_occupied? 4, 5).to eq(true)
	end

	it 'Should create a large ship in yCoord +1 too.' do
		@board.create_large_ship 4, 5
		expect(@board.is_occupied? 4, 6).to eq(true)
	end

	it 'I create a Small ship in x => 2 y => 2 and i shoot it.' do
		@board.create_small_ship 2, 2
		expect(@board.shoot 2, 2).to eq("Sink")
	end

	it 'I create a Large Ship in x => 2 y => 2 and i shoot it.' do
		@board.create_large_ship 2, 2
		expect(@board.shoot 2, 2).to eq("Hit")
	end

	it 'Shooting an empty location.' do
		expect(@board.shoot 1,1).to eq("Miss")
	end

end