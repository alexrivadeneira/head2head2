class CreateChats < ActiveRecord::Migration
  def up
    create_table :chats do |t|
    	t.string "text"
      t.integer "rating_id"
    	t.integer "user_id"
      t.timestamps null: false
    end
  end

  def down
    drop_table :chats

  end
end
