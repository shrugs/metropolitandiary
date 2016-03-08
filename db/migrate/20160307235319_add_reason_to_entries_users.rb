class AddReasonToEntriesUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :entries_users, :reason, :integer, default: 0
  end
end
