class AddRatedToUsers < ActiveRecord::Migration
	def up
		add_column "users", "rated", :boolean, :default => false
	end

	def down
		remove_column "users", "rated", :boolean, :default => false
	end
end

