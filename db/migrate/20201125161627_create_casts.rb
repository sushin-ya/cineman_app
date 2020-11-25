class CreateCasts < ActiveRecord::Migration[6.0]
  def change
    create_table :casts do |t|
      t.string :name, null: false, unique: true

      t.timestamps
    end
  end
end
