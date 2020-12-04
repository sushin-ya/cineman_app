class CreateDirections < ActiveRecord::Migration[6.0]
  def change
    create_table :directions do |t|
      t.integer :director_id
      t.integer :movie_id

      t.timestamps
    end
    add_index :directions, %i[director_id movie_id], unique: true
  end
end
