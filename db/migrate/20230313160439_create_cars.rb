class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.string :type
      t.string :fuel
      t.string :make
      t.integer :seats

      t.timestamps
    end
  end
end
