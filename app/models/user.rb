class User

	@@counter = 0
	include DataMapper::Resource

	property :id, Serial
	property :email, String
	property :password, String

	def self.increment_counter
	       @@counter += 1	
	end

	def self.counter
		@@counter
	end
end
