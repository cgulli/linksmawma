require 'spec_helper.rb'


feature 'add tag' do
  scenario 'adds tags to the link' do
    visit '/links/new'
    fill_in 'title', with: "MagicSeaweed"
    fill_in 'url', with: "www.magicseaweed.com"
    fill_in 'tag', with: "surf"
    click_button 'Submit'
    expect(page).to have_content "surf"
  end
end
