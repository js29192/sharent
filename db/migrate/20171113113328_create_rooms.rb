class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :pg_id
      t.integer :room_number
      t.integer :room_type_id
      t.integer :floor_id
      t.integer :number_of_beds

      t.timestamps null: false
    end
  end
end
