class ConvertRadiusToMeters < ActiveRecord::Migration[5.0]
  def change
    remove_column :entries, :radius
    add_column :entries, :radius, :integer
  end
end
