Given(/^there are items "(.*?)"$/) do |items|
  items.split(',').map(&:strip).each { |cleaned_name| Item.create(name: cleaned_name) }
end

Then(/^I should see item "(.*?)"$/) do |item_name|
  expect(page).to have_content item_name
end
