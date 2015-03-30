class ChangeScoreColumnOnAssignments < ActiveRecord::Migration
	def up
		change_column "assignments", "score", :integer, :default => 0
	end

	def down
		change_column "assignments", "score", :integer	

	end
end

