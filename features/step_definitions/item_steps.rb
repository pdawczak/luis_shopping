Given(/^there are items "(.*?)"$/) do |items|
  items.split(',').map(&:strip).each { |cleaned_name| Item.create(name: cleaned_name) }
end

Then(/^I should see item "(.*?)"$/) do |item_name|
  expect(page).to have_content item_name
end

When(/^I fill in items name form field with "(.*?)"$/) do |item_name|
  within("#new_item") do
    fill_in "Item name", with: item_name
  end
end

When(/^I submit new item form$/) do
  click_button "Add"
end
