require_relative 'concerns/datehelper.rb'

class Room < ApplicationRecord
  has_many :reservations
  include Datehelper

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


  private


end
