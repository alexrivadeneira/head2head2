class AddGameToGuesses < ActiveRecord::Migration
	def up
		add_column "guesses", "game_id", :integer
	end

	def down
		remove_column "guesses", "game_id", :integer
	end
end
