require_relative '../../model/board.rb'
require_relative '../../model/ships.rb'


Given(/^a board with dimensions "(\d+)" x "(\d+)"$/) do |xCoord, yCoord|
 	@board = Board.new xCoord.to_i, yCoord.to_i
end

Given(/^I create a small ship in position "(\d+):(\d+)"$/) do |xCoord, yCoord|
  	@board.create_small_ship xCoord.to_i, yCoord.to_i
end

Given(/^I create a large ship in position "(\d+):(\d+)"$/) do |xCoord, yCoord|
  	@board.create_large_ship xCoord.to_i, yCoord.to_i
end

Then(/^position "(\d+):(\d+)" is not empty$/) do |xCoord, yCoord|
  	expect(@board.is_occupied? xCoord.to_i, yCoord.to_i).to eq(true)
end

When(/^I create a large ship in position "([^"]*)" it should fail with "([^"]*)"$/) do |xCoord, yCoord|
	expect {@board.create_large_ship xCoord.to_i, yCoord.to_i}.to raise_error "Out of bounds"
end



