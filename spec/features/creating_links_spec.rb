feature 'Form to submit link' do
  scenario 'on the new link page the user can complete a form to add a link' do
    sign_in
    visit ('/links/new')
    fill_in('title', with: 'Makers Academy')
    fill_in('url', with: 'http://www.makersacademy.com')
    click_button('submit')
    expect(page).to have_content "Makers Academy"
  end
end
