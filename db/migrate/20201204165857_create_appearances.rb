class CreateAppearances < ActiveRecord::Migration[6.0]
  def change
    create_table :appearances do |t|
      t.integer :cast_id
      t.integer :movie_id

      t.timestamps
    end
    add_index :appearances, %i[cast_id movie_id], unique: true
  end
end
