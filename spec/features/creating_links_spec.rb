require 'spec_helper.rb'
require 'database_cleaner'

feature 'add links' do
  scenario 'adds links to the database' do
    visit '/links/new'
    fill_in 'title', with: "Google"
    fill_in 'url', with: "www.google.com"
    click_button 'Submit'
    expect(page).to have_content "Google"
  end
end
