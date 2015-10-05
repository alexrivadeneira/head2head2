class Guess < ActiveRecord::Base

	validates_uniqueness_of :user_id, :scope => :rating_id

	belongs_to :user
	belongs_to :rating


end
