class AddTimestampsToUserEntryTable < ActiveRecord::Migration[5.0]
  def change
    add_column :entries_users, :created_at, :datetime
    add_column :entries_users, :updated_at, :datetime
  end
end
