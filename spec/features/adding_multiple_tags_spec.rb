feature 'Adding multiple tags' do
  scenario 'Link shows multiple tags if given' do
    Link.create(title: 'Amazon', url: 'amazon.com', tags: [Tag.create(name: 'shopping'), Tag.create(name: 'cloud')])
    visit('/links')
    expect(page).to satisfy { |page| page.has_content?('shopping') and page.has_content?('cloud')}
  end
  scenario 'When I fill in the form, multiple tags are created'do
    visit ('/links/new')
    fill_in('tags', with: 'science, fun')
    click_button('submit')
    expect(page).to satisfy { |page| page.has_content?('science') and page.has_content?('fun')}
  end
  scenario 'does not show link with a different tag' do
    Link.create(title: 'Amazon', url: 'amazon.com', tags: [Tag.create(name: 'science')])
    visit ('/links/new')
    fill_in('title', with: 'Materials World')
    fill_in('tags', with: 'science, fun')
    click_button('submit')
    visit '/tags/science'
    expect(page).to have_content 'Materials World'
  end
end
