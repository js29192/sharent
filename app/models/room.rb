class Room < ActiveRecord::Base
  belongs_to :pg
  belongs_to :floor
  belongs_to :room_type
end
