require 'rspec'
require_relative '../model/board.rb'
require_relative '../model/ships.rb'

describe 'a Board' do

	it 'Should create a Board successfully' do
		expect(Board.new 2,3).to be_an_instance_of(Board)
	end

	it 'Should create a SmallShip in x => 2, y => 3' do
		board = Board.new 3, 3
		board.create_ship SmallShip.new, 2, 3
		expect(board.is_occupied?(2,3)).to eq(true)
	end

end