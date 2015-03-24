class CreateGuesses < ActiveRecord::Migration
  def up
    create_table :guesses do |t|
    	t.integer "user_id"
    	t.integer "rating_id"

    	t.boolean "outcome"

      t.timestamps null: false
    end
  end

  def down
    drop_table :guesses
  end

end
