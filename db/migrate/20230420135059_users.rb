class Users < ActiveRecord::Migration[7.0]
  has_many :records
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.timestamps
    end
  end
end
