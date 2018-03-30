class Room < ApplicationRecord
  has_many :reservations

  def check_availability(start_date, end_date)

    reservations.each do |reservation|
      if overlap_date_range?(start_date, end_date, reservation)
        return :UNAVAILABLE
      end
    end
    return :AVAILABLE

  end


  private

  def overlap_date_range?(start_date, end_date, reservation)
    reservation_range = (reservation.start_date...reservation.end_date).to_a
    check_range = (start_date..end_date).to_a
    overlap = reservation_range & check_range
    return !overlap.empty?
  end
end
