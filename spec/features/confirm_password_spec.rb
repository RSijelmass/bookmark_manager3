feature 'confirms password' do
  scenario 'user enters password confirmation which does not match' do
    visit '/'
    fill_in('email', with: 'a@b.com')
    fill_in('password', with: 'password1')
    fill_in('confirmation', with: 'password2')
    expect { click_button('Sign in') }.to change { User.count } .by 0
    expect(page).to have_content('Enter your email')
  end

  scenario 'if password and confirmation do not match, error message displayed' do
    visit '/'
    fill_in('email', with: 'a@b.com')
    fill_in('password', with: 'password1')
    fill_in('confirmation', with: 'password2')
    click_button 'Sign in'
    expect(page).to have_content('Password and Confirmation do not match! Try again.')
  end
end
