class AdminController < ApplicationController

  def index
    @rooms = Room.all
    @reservations = Reservation.all
  end
end
