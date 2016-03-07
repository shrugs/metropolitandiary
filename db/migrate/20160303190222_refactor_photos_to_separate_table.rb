class RefactorPhotosToSeparateTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :entries, :photo

    create_table :photos do |t|
      t.string :url, null: false
      t.string :attribution
      t.references :entry

      t.timestamps
    end
  end
end
