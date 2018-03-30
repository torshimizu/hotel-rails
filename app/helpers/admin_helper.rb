module AdminHelper

  def new_reservation(input)
    start_date = input[:start_date]
    end_date = input[:end_date]

    available_room = find_available_rooms(start_date, end_date).first

    new_details = input.merge({room_id: available_room.room_id, room: available_room})
    Reservation.create(new_details)
  end



end
