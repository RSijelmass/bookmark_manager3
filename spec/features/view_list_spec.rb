
feature 'viewing list of bookmarked links' do
  scenario 'when user visits the homepage, display list of links' do
    Link.create(url: 'http://google.com', title: 'Google')
    sign_in
    expect(page).to have_content 'Bookmarks List'
    within 'ul#links' do
      expect(page).to have_content('Google')
    end
  end
end
