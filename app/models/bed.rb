class Bed < ActiveRecord::Base
  belongs_to :room
  delegate :pg, to: :room
end
