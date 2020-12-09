class CreateScreenwrites < ActiveRecord::Migration[6.0]
  def change
    create_table :screenwrites do |t|
      t.integer :screenwriter_id
      t.integer :movie_id

      t.timestamps
    end
    add_index :screenwrites, %i[screenwriter_id movie_id], unique: true
  end
end
