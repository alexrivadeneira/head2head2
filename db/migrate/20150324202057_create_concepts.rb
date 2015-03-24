class CreateConcepts < ActiveRecord::Migration
  def up
    create_table :concepts do |t|
    	t.string "title"
      t.timestamps null: false
    end
  end

  def down
    drop_table :users
  end 
  
end
