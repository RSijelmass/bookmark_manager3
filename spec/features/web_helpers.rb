def sign_in
	visit '/'
	fill_in('email', with: 'colin@scally.com')
	fill_in('password', with: 'password')
	fill_in('confirmation', with: 'password')
	click_button 'Sign in'
end
