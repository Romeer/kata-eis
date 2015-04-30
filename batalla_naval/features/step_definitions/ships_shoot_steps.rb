
Given(/^a large ship in position: “(\d+):(\d+)”$/) do |xCoord, yCoord|
	@board.create_large_ship xCoord.to_i, yCoord.to_i
end

Given(/^I shoot to position “(\d+):(\d+)”$/) do |xCoord, yCoord|
	@result = @board.shoot xCoord.to_i, yCoord.to_i
end

Then(/^I get hit$/) do
	expect(@result).to eq("Hit")
end

Then(/^I get miss$/) do
  expect(@result).to eq("Miss")
end

