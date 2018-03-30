class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    room_id = params[:id]
    @room = Room.find(room_id)
  end
end
