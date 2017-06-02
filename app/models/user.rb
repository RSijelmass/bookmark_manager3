require 'bcrypt'

class User
	include BCrypt
	include DataMapper::Resource

	property :id, Serial
	property :email, String
	property :password_hash, Text 

	def password=(password)
		self.password_hash = BCrypt::Password.create(password)
	end
end
