class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.string :owner
      t.string :address
      t.integer :rooms
      t.integer :sqmt
      t.integer :floor
      t.boolean :air_cond
      t.decimal :price
      t.references :user
      t.timestamps
    end
  end
end
