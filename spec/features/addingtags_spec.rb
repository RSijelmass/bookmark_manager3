feature "Adding tags" do
  scenario "Adds a tag to a link by submitting the form" do
    visit ('/links/new')
    fill_in('tags', with: 'science')
    click_button('submit')
    expect(page).to have_content "science"
  end
end
