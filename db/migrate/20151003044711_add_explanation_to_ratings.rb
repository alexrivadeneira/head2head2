class AddExplanationToRatings < ActiveRecord::Migration
	def up
		add_column "ratings", "explanation", :string
	end

	def down
		remove_column "ratings", "explanation", :string
	end
end

