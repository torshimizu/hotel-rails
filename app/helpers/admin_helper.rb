module AdminHelper

  def list_reservations(start_date)
    start = start_date
    date_reservations = Reservation.where("start_date <= ? and end_date > ?", start, start)
    return date_reservations.empty? ? nil : date_reservations
  end

  def find_reservation(start_date:, room_id:)
    start = start_date
    found_reservation = Reservation.where("start_date = ? and room_id = ?", start, room_id)
    return found_reservation.empty? ? nil : found_reservation
  end

  def new_reservation(input)

    available_room = find_available_rooms(start_date, end_date).first

    if !available_room.empty?
      return 'I have found a room!'
    else
      return 'This sucks'
    end
  end

  def find_available_rooms(start_date, end_date)
    rooms = Room.all
    available_rooms = rooms.select { |room| room.check_availability(start_date, end_date) == :AVAILABLE }

    return available_rooms
  end
end
