class User < ActiveRecord::Base
	has_secure_password

	validates :email, uniqueness: true
	validates :name, uniqueness: true

	has_many :ratings
	has_many :concepts, through: :ratings

	has_many :guesses
	has_many :assignments
	has_many :games, through: :assignments

	has_many :chats
	has_many :comments, through: :chats

	accepts_nested_attributes_for :games

	# ? has_many :assignments ? 
end
