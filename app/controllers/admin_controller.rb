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
    @days_reservations = list_reservations(start_date)
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def list_reservations(start_date)
    start = start_date.to_datetime
    reservations = Reservation.all
    date_reservations = reservations.where("start_date < ? and end_date > ?", start, start)
    return date_reservations.empty? ? nil : date_reservations
  end
end
