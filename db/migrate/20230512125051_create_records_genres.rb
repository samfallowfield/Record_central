class CreateRecordsGenres < ActiveRecord::Migration[7.0]
  def change
    create_table :record_genres do |t|
      t.integer :record_id
      t.integer :genre_id

    end
  end
end
