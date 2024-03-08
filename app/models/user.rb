class User < ApplicationRecord
  has_many :order_detail
end