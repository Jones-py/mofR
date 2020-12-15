class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.string :rail_way_line
      t.string :station_name
      t.string :minutes_walk
      t.timestamps
    end
  end
end
