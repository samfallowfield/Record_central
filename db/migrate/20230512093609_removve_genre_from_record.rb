class RemovveGenreFromRecord < ActiveRecord::Migration[7.0]
  def change
    remove_column :records, :genre
  end
end
