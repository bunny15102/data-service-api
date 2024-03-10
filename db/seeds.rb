require 'csv'
require 'activerecord-import'
# usage : rake db:seed
def truncate_all_tables()
  OrderDetail.delete_all
  User.delete_all
  Product.delete_all
end

def import_data(model_class, csv_path, attribute_mapping)
  records = []

  CSV.foreach(csv_path, headers: true) do |row|
    attributes = attribute_mapping.transform_values { |column_name| row[column_name].presence }
    if model_class == OrderDetail
      user = User.find_by_email(attributes[:user_id])
      product = Product.find_by_code(attributes[:product_id])
      attributes[:user_id] = user.id if user.present?
      attributes[:product_id] = product.id if product.present?
    end
    p attributes
    records << model_class.new(attributes)
    p records
  end
  model_class.import(records, on_duplicate_key_ignore: true)
end


truncate_all_tables()
# Import Users from CSV
import_data(User, "#{Rails.root}/scripts/csv/users.csv", { user_name: 'user_name', email: 'email', phone: 'phone' })

# Import Products from CSV
import_data(Product, "#{Rails.root}/scripts/csv/products.csv", { code: 'code', name: 'name', category: 'category' })

# Import OrderDetails from CSV
import_data(OrderDetail, "#{Rails.root}/scripts/csv/order_details.csv", { user_id: 'user_email', product_id: 'code', order_date: 'order_date' })
