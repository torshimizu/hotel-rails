module ReservationsHelper
  def past_reservation(reservations)
    past_reservations = []
    reservations.each do |reservation|
      if reservation.end_date < Date.today
        past_reservations << reservation
      end
    end
    return past_reservations
  end

  def present_reservation(reservations)
    present_reservations = []
    reservations.each do |reservation|
      if reservation.end_date >= Date.today
        present_reservations << reservation
      end
    end
    present_reservations = present_reservations.sort_by {|reservation| reservation.end_date }
    return present_reservations
  end

end
