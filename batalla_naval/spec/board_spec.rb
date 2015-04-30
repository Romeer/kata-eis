require 'rspec'
require_relative '../model/board.rb'

describe 'a Board' do

	it 'Should create a Board successfully' do
		expect(Board.new 2,3).to be_an_instance_of(Board)
	end

end