require 'csv'
require 'activerecord-import'

def import_data(model_class, csv_path, attribute_mapping)
  records = []

  CSV.foreach(csv_path, headers: true) do |row|
    attributes = attribute_mapping.transform_values { |column_name| row[column_name] }
    records << model_class.new(attributes)
  end
  
  model_class.import(records, validate: true)
end

# Import OrderDetails from CSV
import_data(OrderDetail, '../scripts/csv/order_details.csv', { attribute1: 'attribute1', attribute2: 'attribute2' })

# Import Products from CSV
import_data(Product, '../scripts/csv/products.csv', { attribute1: 'attribute1', attribute2: 'attribute2' })

# Import Users from CSV
import_data(User, '../scripts/csv/users.csv', { user_name: 'user_name', email: 'email', phone: 'phone' })
