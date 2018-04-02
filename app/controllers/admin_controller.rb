class AdminController < ApplicationController

  def index
    @rooms = Room.all
    @reservations = Reservation.all
  end

  # def show
  #   start_date = params[:start_date]
  #   room_id = params[:room_id]
  #
  #   if room_id.nil?
  #     @days_reservations = helpers.list_reservations(start_date)
  #   else
  #     @found_reservation = helpers.find_reservation(start_date: start_date, room_id: room_id)
  #   end
  # end

end
