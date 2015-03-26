class User < ActiveRecord::Base
	has_secure_password

	has_many :ratings
	has_many :concepts, through: :ratings

	has_many :guesses
	has_many :assignments
	has_many :games, through: :assignments
	# ? has_many :assignments ? 
end
