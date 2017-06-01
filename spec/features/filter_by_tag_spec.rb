feature 'filter by tag' do
  scenario 'visit tags/[specific tag] and see a list with specific tag' do
    visit '/links/new'
    fill_in('title', with: 'Amazon')
    fill_in('url', with: 'amazon.com')
    fill_in('tags', with: 'shopping')
    click_button 'submit'

    visit '/tags/shopping'
    expect(page).to have_content 'Amazon'
  end
end
