class Rating < ActiveRecord::Base
	belongs_to :concept
	belongs_to :user

	has_many :guesses
end
