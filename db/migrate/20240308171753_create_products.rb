class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products, if_not_exists: true do |t|
      t.string :code
      t.string :name
      t.string :category
      t.timestamps
    end
  end
end
