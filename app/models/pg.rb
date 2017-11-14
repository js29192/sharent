class Pg < ActiveRecord::Base
  has_many :rooms
  has_many :beds, through: :rooms
end
