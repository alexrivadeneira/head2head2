class CreateGames < ActiveRecord::Migration
  def up
    create_table :games do |t|
    	t.integer "user_id"

    	t.string "title"
      t.timestamps null: false
    end
  end

  def down
    drop_table :games do |t|

  end

end
