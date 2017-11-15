class Room < ActiveRecord::Base
  belongs_to :pg
  belongs_to :floor
  belongs_to :room_type
  has_many :beds
  before_destroy :destroy_beds

  def destroy_beds
    self.beds.destroy_all
  end
end
