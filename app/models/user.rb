require 'bcrypt'

class User
	include BCrypt
	include DataMapper::Resource

	property :id, Serial
	property :email, String
	property :password_hash, Text

	validates_confirmation_of :password

	attr_reader :password
	attr_accessor :password_confirmation

	def password=(password)
		@password = password
		self.password_hash = BCrypt::Password.create(password)
	end
end
