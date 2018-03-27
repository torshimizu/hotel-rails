class CreateHotels < ActiveRecord::Migration[5.1]
  def change
    create_table :hotels do |t|
      t.string :hotel_name
      t.integer :number_of_rooms

      t.timestamps
    end
  end
end
