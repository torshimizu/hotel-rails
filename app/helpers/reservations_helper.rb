module ReservationsHelper
  def get_available_room(start_date, end_date)
    return find_available_rooms(start_date, end_date).first
  end

  def find_available_rooms(start_date, end_date)
    rooms = Room.all
    available_rooms = rooms.select { |room| room.check_availability(start_date, end_date) == :AVAILABLE }

    return available_rooms
  end
end
