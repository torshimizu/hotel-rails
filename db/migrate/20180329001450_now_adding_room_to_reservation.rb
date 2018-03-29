class NowAddingRoomToReservation < ActiveRecord::Migration[5.1]
  def change
    add_reference :reservations, :room, foreign_key: true
  end
end
