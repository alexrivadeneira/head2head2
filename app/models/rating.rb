class Rating < ActiveRecord::Base

	# a user id must have unique concepts associated with it
	validates_uniqueness_of :user_id, :scope => :concept_id

	belongs_to :concept
	belongs_to :user

	has_many :guesses

	has_many :chats
	has_many :comments, through: :chats
end
