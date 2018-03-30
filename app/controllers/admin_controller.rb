class AdminController < ApplicationController

  def index
    @rooms = Room.all
    @reservations = Reservation.all
  end

  def new

  end

  def create

  end

  def show
    start_date = params[:start_date]
    @days_reservations = helpers.list_reservations(start_date)
  end

  def edit
  end

  def update
  end

  def delete
  end

end
