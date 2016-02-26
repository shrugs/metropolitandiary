class CreateApiV1Entries < ActiveRecord::Migration[5.0]
  def change
    create_table :api_v1_entries do |t|
      t.string :title
      t.text :content
      t.string :author
      t.string :permalink
      t.datetime :date_published

      t.timestamps
    end
  end
end
