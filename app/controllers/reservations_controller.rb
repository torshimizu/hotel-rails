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
    @reservation = Reservation.new(reservation_params)
    @reservation.room_id = available_room.id

    if @reservation.save
      redirect_to reservation_path(@reservation.id)
    else
      render :new
    end
  end

  def show
    reservation_id = params[:id]
    @reservation = Reservation.find(reservation_id)
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation.assign_attributes(reservation_params)

    if @reservation.save
      redirect_to '/reservations'
    else
      render 'edit'
    end
  end

  def delete
  end

  def by_date
    date = params[:search_date]

    @days_reservations = helpers.list_reservations(date)
  end

  private

  def reservation_params
    return params.require(:reservation).permit(:start_date, :end_date, :guest_last_name, :guest_first_name, :daily_rate)
  end

end
