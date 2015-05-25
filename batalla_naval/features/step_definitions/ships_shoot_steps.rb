
Given(/^a large ship in position: “(\d+):(\d+)”$/) do |xCoord, yCoord|
	fill_in 'x_coord_large', :with => xCoord
  fill_in 'y_coord_large', :with => yCoord
  click_button 'button_new_large_ship'
end

Given(/^I shoot to position “(\d+):(\d+)”$/) do |xCoord, yCoord|
	fill_in 'shoot_x', :with => xCoord
  fill_in 'shoot_y', :with => yCoord
  click_button 'button_shoot'
end

Then(/^I get hit$/) do
	expect(page.has_content? 'Hit').to eq(true)
end

Then(/^I get miss$/) do
	expect(page.has_content? 'Miss').to eq(true)
end

Then(/^I get sink$/) do
	expect(page.has_content? 'Sink').to eq(true)
end
