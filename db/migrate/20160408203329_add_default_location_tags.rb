class AddDefaultLocationTags < ActiveRecord::Migration[5.0]
  def change
    change_column :entries, :lat, :decimal, default: 0.0, null: false
    change_column :entries, :lng, :decimal, default: 0.0, null: false
    change_column :entries, :radius, :decimal, default: 500.0, null: false
  end
end
