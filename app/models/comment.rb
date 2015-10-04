class Comment < ActiveRecord::Base
	belongs_to :guess
	belongs_to :user
	belongs_to :chat
end
