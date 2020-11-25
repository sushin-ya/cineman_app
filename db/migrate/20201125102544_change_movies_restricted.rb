class ChangeMoviesRestricted < ActiveRecord::Migration[6.0]
  def up
    change_column :movies, :title, :string, null: false, unique: true
    change_column :movies, :production_year, :integer, null: false, limit: 4
  end

  def down
    change_column :movies, :title, :string
    change_column :movies, :production_year, :integer
  end
end
