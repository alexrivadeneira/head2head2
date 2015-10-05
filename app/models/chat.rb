class Chat < ActiveRecord::Base
	belongs_to :rating

	has_many :comments
end
