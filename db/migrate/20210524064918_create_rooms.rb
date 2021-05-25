class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.references :user, foreign_key: true
      t.string :description
      t.integer :rate
      t.integer :bathroom
      t.boolean :wifi

      t.timestamps
    end
  end
end
