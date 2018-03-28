class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create

  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def reservation_params
    return params.require(:start_date, :end_date, :guest_last_name)
  end
end
