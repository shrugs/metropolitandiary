class AddLatLngToEntry < ActiveRecord::Migration[5.0]
  def change
    add_column :entries, :lat, :decimal, {:precision => 10, :scale => 6}
    add_column :entries, :lng, :decimal, {:precision => 10, :scale => 6}
  end
end
