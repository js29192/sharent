module RoomsHelper
  def floors
    Floor.all
  end
  def room_types
    RoomType.all
  end
end
