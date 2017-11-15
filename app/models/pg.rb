class Pg < ActiveRecord::Base
  has_many :rooms
  has_many :beds, through: :rooms
  belongs_to :user
  before_destroy :destroy_rooms

  def destroy_rooms
    self.rooms.destroy_all
  end
end
