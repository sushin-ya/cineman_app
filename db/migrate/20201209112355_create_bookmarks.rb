class CreateBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks do |t|
      t.integer :user_id
      t.integer :movie_id

      t.timestamps
    end
    add_index :bookmarks, %i[user_id movie_id], unique: true
  end
end
