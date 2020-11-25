class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :production_year
      t.date :screening_date
      t.string :country_of_origin
      t.integer :screening_time
      t.string :director
      t.text :description

      t.timestamps
    end
  end
end
