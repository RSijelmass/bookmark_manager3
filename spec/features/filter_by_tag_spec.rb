feature 'filter by tag' do
  before do
    Link.create(title: 'Amazon', url: 'amazon.com', tags: [Tag.create(name: 'shopping')])
    Link.create(title: 'Reddit', url: 'reddit.com', tags: [Tag.create(name: 'entertainment')])
  end

  scenario 'visit tags/[specific tag] and see a list with specific tag' do
    sign_in
    visit '/tags/shopping'
    expect(page).to have_content 'Amazon'
   end

  scenario 'does not show link with a different tag' do
    sign_in
    visit '/tags/shopping'
    expect(page).to_not have_content 'Reddit'
  end


end
