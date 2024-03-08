class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, if_not_exists: true do |t|
      t.string :user_name, null: false, index: { unique: true }
      t.string :email, null: false, index: { unique: true }
      t.string :phone, null: false, index: { unique: true }
      t.timestamps
    end
  end
end
