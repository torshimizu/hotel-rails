class Room < ApplicationRecord
  has_many :reservations

  def check_availability(start_date, end_date)
    start_date = parse(start_date)
    end_date = parse(end_date)

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

  def parse(date)
      case
      when date.instance_of?(Date)
        return date
      when date.match(/^\d{2,4}-\d{1,2}-\d{1,2}$/)
        Date.parse(date)
      when date.match(/^\d{1,2}-\d{1,2}-\d{4}$/)
        Date.strptime(date, '%m-%d-%Y')
      when date.match(/^\d{1,2}\/\d{1,2}\/\d{4}$/)
        Date.strptime(date, '%m/%d/%Y')
      when date.match(/^\d{6,8}$/)
        Date.parse(date)
      end
  end
end
