module ReservationsHelper
  def get_available_room(start_date, end_date)
    return find_available_rooms(start_date, end_date).first
  end

  def find_available_rooms(start_date, end_date) # this maybe should not be here as Reservations should not know about Room
    rooms = Room.all
    available_rooms = rooms.select { |room| room.check_availability(start_date, end_date) == :AVAILABLE }

    return available_rooms
  end

  def list_reservations(start_date)
    start = Date.parse(start_date)
    date_reservations = Reservation.where("start_date <= ? and end_date > ?", start, start)
    return date_reservations.empty? ? nil : date_reservations
  end

  # def find_reservation(start_date:, guest_last_name:)
  #   start = start_date
  #   found_reservation = Reservation.where("start_date = ? and guest_last_name = ?", start, guest_last_name)
  #   return found_reservation.empty? ? nil : found_reservation
  # end
end
