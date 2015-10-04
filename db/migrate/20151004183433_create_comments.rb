class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
    	t.string "text", null: false

      t.timestamps null: false
    end
  end

  def down
    drop_table :comments

  end
end
