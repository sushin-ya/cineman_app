class CreateGenreClassifications < ActiveRecord::Migration[6.0]
  def change
    create_table :genre_classifications do |t|
      t.integer :genre_id
      t.integer :movie_id

      t.timestamps
    end
    add_index :genre_classifications, %i[genre_id movie_id], unique: true
  end
end
