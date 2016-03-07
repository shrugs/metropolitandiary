class AddTimeZoneToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :timezone, :string, :default => 'America/New_York', :null => false
  end
end
