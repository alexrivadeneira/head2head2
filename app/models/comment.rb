class Commment < ActiveRecord::Base
	belongs_to :guess
	belongs_to :user
end
