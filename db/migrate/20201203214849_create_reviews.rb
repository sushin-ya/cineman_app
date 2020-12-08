class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :body
      t.float :rate, default: 0
      t.references :user, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
    add_index :reviews, %i[user_id created_at]
    add_index :reviews, %i[movie_id created_at]
  end
end
