class ChangeAverageColumnOnUsers < ActiveRecord::Migration
	def up
		change_column "users", "average", :integer, :default => 0
	end

	def down
		change_column "users", "average", :integer	

	end
end