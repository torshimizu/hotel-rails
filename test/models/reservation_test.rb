require "test_helper"

describe Reservation do
  let(:new_room) { Room.new }
  let(:info) { {start_date: (Date.today+1), end_date: (Date.today + 3), guest_last_name: 'Pig'} }
  let(:reservation) { Reservation.new(info) }

  it "must be valid" do
    reservation.room = new_room
    value(reservation).must_be :valid?
  end
end
