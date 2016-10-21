
feature 'Filtering by tags' do

  # before (:each) do
  #   Link.create(url: "http://www.dogs.com", title: "Dogs r us", tags: [Tag.first_or_create(tag: "pets")])
  #   Link.create(url: "http://www.bubble-bobble.com", title: "bubble-bobble", tags: [Tag.first_or_create(tag: "bubbles")])
  #   Link.create(url: "http://www.hotmail.com", title: "Hotmail", tags: [Tag.first_or_create(tag: "email")])
  #   Link.create(url: "http://www.bbc.co.uk", title: "BBC", tags: [Tag.first_or_create(tag: "beeb")])
  # end

  scenario 'filters links by specified tag(s)' do
    visit '/links/new'
    fill_in('title', with: "Kitten Academy")
    fill_in('url', with: 'http://www.kittenacademy.com')
    fill_in('tag', with: 'bubbles')
    click_button('Submit')
    visit '/tags/bubbles'
    expect(page).to have_content("bubbles")
    end
  end
