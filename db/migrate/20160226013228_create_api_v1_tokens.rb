class CreateApiV1Tokens < ActiveRecord::Migration[5.0]
  def change
    create_table :api_v1_tokens do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :token
      t.timestamps
    end
  end
end
