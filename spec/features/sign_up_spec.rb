feature 'user sign in' do
	scenario 'user submits email address and password' do
		visit '/'
		fill_in('email', with: 'colin@scally.com')
		fill_in('password', with: 'password')
		# click_button('Sign in')	
		p User.counter
		expect { click_button ('Sign in') }.to change { User.counter }.by 1
		expect(page).to have_content('Welcome colin@scally.com!')

	end
end
