require_relative '../../model/board.rb'


Given(/^a board with dimensions "([^"]*)" x "([^"]*)"$/) do |xCoord, yCoord|
 	@board = Board.new xCoord, yCoord
end

Given(/^I create a small ship in position "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^position "([^"]*)" is not empty$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end
