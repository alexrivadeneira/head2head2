class CreateRatings < ActiveRecord::Migration
  def up
    create_table :ratings do |t|
      t.integer "user_id"
      t.integer "concept_id"

      t.integer "opinion"
      t.timestamps null: false
    end
  end

  def down
    drop_table :ratings
  end

end
