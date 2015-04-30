require_relative '../../model/board.rb'
require_relative '../../model/ships.rb'


Given(/^a board with dimensions "(\d+)" x "(\d+)"$/) do |xCoord, yCoord|
 	@board = Board.new xCoord.to_i, yCoord.to_i
end

Given(/^I create a small ship in position "(\d+):(\d+)"$/) do |xCoord, yCoord|
  	@board.create_ship SmallShip.new, xCoord.to_i, yCoord.to_i
end

Then(/^position "(\d+):(\d+)" is not empty$/) do |xCoord, yCoord|
  pending # Write code here that turns the phrase above into concrete actions
end
