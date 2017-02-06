class CreateVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicles do |t|
      t.string :plate_number
      t.string :matriculation_date
      t.time :time

      t.timestamps
    end
  end
end
