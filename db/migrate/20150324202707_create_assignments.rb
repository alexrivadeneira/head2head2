class CreateAssignments < ActiveRecord::Migration
  def up
    create_table :assignments do |t|

    	t.integer "game_id"
    	t.integer "user_id"

    	t.integer "score"
    	
      t.timestamps null: false
    end
  end

  def down
    drop_table :assignments do |t|
  end

end
