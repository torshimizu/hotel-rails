require_relative 'concerns/datehelper.rb'

class Room < ApplicationRecord
  include Datehelper

  has_many :reservations

  def self.no_overlap(checkin, checkout)
    checkin = Datehelper.parse(checkin)
    checkout = Datehelper.parse(checkout)
  # returns entries that do not overlap with range
    return Room.all.select {|room| room.check_availability(checkin, checkout) == :AVAILABLE}
  end

  def check_availability(start_date, end_date)
    start_date = Datehelper.parse(start_date)
    end_date = Datehelper.parse(end_date)

    reservations.each do |reservation|
      if Datehelper.overlap_date_range?(start_date, end_date, reservation)
        return :UNAVAILABLE
      end
    end
    return :AVAILABLE

  end


end
