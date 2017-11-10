class CreatePgs < ActiveRecord::Migration
  def change
    create_table :pgs do |t|
      t.string   "pg_name", null: false
      t.string   "address"
      t.integer  "area"
      t.integer  "city"
      t.integer  "state"
      t.string   "pin_code"
      t.integer  "user_id"
      t.integer  "normal_bed_price"
      t.integer  "ac_bed_price"

      t.timestamps null: false
    end
  end
end
