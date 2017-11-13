class ChangeStateCityAreaColToPgs < ActiveRecord::Migration
  def change
  	remove_column :pgs, :state
  	remove_column :pgs, :city
  	remove_column :pgs, :area
  	add_column :pgs, :state_id, :integer
  	add_column :pgs, :city_id, :integer
  	add_column :pgs, :area_id, :integer
  end
end
