class CreateEnquiries < ActiveRecord::Migration
  def change
    create_table :enquiries do |t|
      t.string :full_name
      t.integer :mobile_number
      t.integer :number_of_seats
      t.integer :pg_id
      t.integer :room_type_id

      t.timestamps null: false
    end
  end
end
