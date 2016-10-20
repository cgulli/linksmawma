
feature 'Filtering by tags' do

  before (:each) do
    Link.create(url: "http://www.dogs.com", title: "Dogs r us", tags: [Tag.first_or_create(tag: "pets")])
    Link.create(url: "http://www.bubble-bobble.com", title: "bubble-bobble", tags: [Tag.first_or_create(tag: "bubbles")])
    Link.create(url: "http://www.hotmail.com", title: "Hotmail", tags: [Tag.first_or_create(tag: "email")])
    Link.create(url: "http://www.bbc.co.uk", title: "BBC", tags: [Tag.first_or_create(tag: "beeb")])
  end

  scenario 'filters links by specified tag(s)' do
    visit '/tags/bubbles'
    expect(page.status_code).to eq (200)
    within 'ul#links' do
      expect(page).not_to have_content('Dogs r us')
      expect(page).not_to have_content('BBC')
      expect(page).not_to have_content('Hotmail')
      expect(page).to have_content("bubbles")
    end
  end
end
