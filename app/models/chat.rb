class Chat < ActiveRecord::Base
	belongs_to :guess
	belongs_to :user

	has_many :comments
end
