class OrderDetail < ApplicationRecord
  has_many :products
  belongs_to :users
end