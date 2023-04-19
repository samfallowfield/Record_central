class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|

      t.string :artist
      t.string :album
      t.string :genre
      t.string :variant
      t.text :description
      t.timestamps
    end
  end
end
