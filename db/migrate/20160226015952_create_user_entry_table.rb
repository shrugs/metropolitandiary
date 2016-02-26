class CreateUserEntryTable < ActiveRecord::Migration[5.0]
  def self.up
      create_table :entries_users, :id => false do |t|
        t.integer :entry_id
        t.integer :user_id
      end

      add_index :entries_users, [:entry_id, :user_id]
    end

    def self.down
      drop_table :entries_users
    end
end
