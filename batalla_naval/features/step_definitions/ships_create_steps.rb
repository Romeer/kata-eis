require_relative '../../app/model/board.rb'
require_relative '../../app/model/ships.rb'
require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(locator) { yield } : yield
  end
end
World(WithinHelpers)


Given(/^a board with dimensions "(\d+)" x "(\d+)"$/) do |width, height|
  visit '/battleship'
  fill_in 'width', :with => width
  fill_in 'height', :with => height
  click_button 'button_new_board'
 	@board = Board.new width.to_i, height.to_i
end

Given(/^I create a small ship in position "(\d+):(\d+)"$/) do |xCoord, yCoord|
  fill_in 'x_coord_small', :with => xCoord
  fill_in 'y_coord_small', :with => yCoord
  click_button 'button_new_small_ship'
  @board.create_small_ship xCoord.to_i, yCoord.to_i
end

Given(/^I create a large ship in position "(\d+):(\d+)"$/) do |xCoord, yCoord|
  fill_in 'x_coord_large', :with => xCoord
  fill_in 'y_coord_large', :with => yCoord
  click_button 'button_new_large_ship'
  @board.create_large_ship xCoord.to_i, yCoord.to_i
end

Then(/^position "(\d+):(\d+)" is not empty$/) do |xCoord, yCoord|
  fill_in 'x_coord', :with => xCoord
  fill_in 'y_coord', :with => yCoord
  click_button 'button_is_occupied'

  expect(page.has_content? 'occupied').to eq(true)

  expect(@board.is_occupied? xCoord.to_i, yCoord.to_i).to eq(true)
end

When(/^I create a large ship in position "([^"]*)" it should fail with "([^"]*)"$/) do |xCoord, yCoord|
  fill_in 'x_coord_large', :with => xCoord
  fill_in 'y_coord_large', :with => yCoord
  click_button 'button_new_large_ship'

  expect(page.has_content? 'Out of bounds').to eq(true)
	expect {@board.create_large_ship xCoord.to_i, yCoord.to_i}.to raise_error "Out of bounds"
end
