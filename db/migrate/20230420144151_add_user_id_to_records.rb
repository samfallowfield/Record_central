class AddUserIdToRecords < ActiveRecord::Migration[7.0]
  def change
    add_column :records, :user_id, :integer
  end
end
