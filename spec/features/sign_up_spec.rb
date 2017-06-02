feature 'user sign in' do
	scenario 'user submits email address and password' do
		visit '/'
		fill_in('email', with: 'colin@scally.com')
		fill_in('password', with: 'password')
		fill_in('confirmation', with: 'password')
		expect { click_button ('Sign in') }.to change { User.count } .by 1
		expect(page).to have_content('Welcome colin@scally.com!')
	end
end
