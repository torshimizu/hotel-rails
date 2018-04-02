module ReservationsHelper
  def get_available_room(start_date, end_date) # this maybe should not be here as Reservations should not know about Room
    rooms = Room.all
    available_rooms = rooms.select { |room| room.check_availability(start_date, end_date) == :AVAILABLE }

    return available_rooms.first
  end

  
end
