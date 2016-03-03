class AddRadiusToEntries < ActiveRecord::Migration[5.0]
  def change
    add_column :entries, :radius, :decimal, {:precision => 10, :scale => 6}
  end
end
