class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products, if_not_exists: true do |t|
      t.string :code, null: false, index: { unique: true }
      t.string :name, null: false
      t.string :category, null: false
      t.timestamps
    end
  end
end
