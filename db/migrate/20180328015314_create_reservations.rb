class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.datetime :start_date
      t.datetime :enddate
      t.string :guest_last_name
      t.string :guest_first_name
      t.integer :room_id
      t.float :daily_rate

      t.timestamps
    end
  end
end
