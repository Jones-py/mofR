class AddBuildingRefToStations < ActiveRecord::Migration[5.2]
  def change
    add_reference :stations, :building, foreign_key: true
  end
end
