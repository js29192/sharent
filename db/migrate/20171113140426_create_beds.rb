class CreateBeds < ActiveRecord::Migration
  def change
    create_table :beds do |t|
      t.integer :bed_number
      t.integer :room_id
      t.integer :user_id
      t.boolean :booked
      t.date :expected_booking_date
      t.date :expected_vacancy_date

      t.timestamps null: false
    end
  end
end
