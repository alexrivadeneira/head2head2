class Comment < ActiveRecord::Base
	belongs_to :rating
	belongs_to :chat
end
