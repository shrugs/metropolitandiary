class CreateApiV1Tokens < ActiveRecord::Migration[5.0]
  def change
    create_table :tokens do |t|
      t.string :contents
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
