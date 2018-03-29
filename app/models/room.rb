class Room < ApplicationRecord
  has_many :reservations

  def check_availability(start_date, end_date)
    start_date = parse(start_date)
    end_date = parse(end_date)

    # if there already is a reservation, then this room is not available
    @reservations.each do |reservation|
      if overlap_date_range?(start_date, end_date, reservation)
        return :UNAVAILABLE
      end
    end
    return :AVAILABLE

  end

end
