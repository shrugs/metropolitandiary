class CreateDevices < ActiveRecord::Migration[5.0]
  def change
    create_table :devices do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.text :device_token
      t.text :endpoint_arn

      t.timestamps
    end
  end
end
