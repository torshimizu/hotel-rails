class UpdateEnddateName < ActiveRecord::Migration[5.1]
  def change
    rename_column :reservations, :enddate, :end_date
  end
end
