Given(/^I am at the home page$/) do
  visit root_path
end

Then(/^I should see "(.*?)"$/) do |expected_text|
  expect(page).to have_content(expected_text)
end
