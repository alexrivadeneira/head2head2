class AddGameToChats < ActiveRecord::Migration
	def up
		add_column "chats", "game_id", :integer
	end

	def down
		remove_column "chats", "game_id", :integer
	end
end
