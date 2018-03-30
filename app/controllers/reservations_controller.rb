class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    info = params[:reservation]
    available_room = helpers.get_available_room(info[:start_date], info[:end_date])
    @new_reservation = Reservation.new
    @new_reservation.start_date = info[:start_date]
    @new_reservation.end_date = info[:end_date]
    @new_reservation.guest_last_name = info[:guest_last_name]
    @new_reservation.room_id = available_room.id

    if @new_reservation.save
      redirect_to reservation_path(@new_reservation.id)
    else
      render :new
    end
  end

  def show
    reservation_id = params[:id]
    @reservation = Reservation.find(reservation_id)
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  # def reservation_params
  #   return params.require(:start_date, :end_date, :guest_last_name).permit(:guest_first_name, :daily_rate)
  # end

end
