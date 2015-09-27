class AddTotalToGames < ActiveRecord::Migration
	def up
		add_column "games", "total", :integer, :default => 0
	end

	def down
		remove_column "games", "total", :integer
	end
end

