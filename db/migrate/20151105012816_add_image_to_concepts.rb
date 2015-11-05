class AddImageToConcepts < ActiveRecord::Migration
	def up
		add_column "concepts", "image", :string
	end

	def down
		remove_column "concepts", "image", :string
	end
end


