class CreateComplexBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :complex_buildings do |t|
      t.string :address
      t.integer :units
      t.integer :sqmt
      t.decimal :price
      t.references :user
      t.timestamps
    end

    create_table :commecial_units do |t|
      t.string :address
      t.integer :shops
      t.integer :sqmt
      t.integer :parking
      t.decimal :price
      t.references :user
      t.timestamps
    end
  end
end
