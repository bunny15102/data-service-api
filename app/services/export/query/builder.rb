module Export
  module Query
    class Builder
      def self.data_query_builder(user_id,offset)
        "select users.user_name,users.email,products.code,products.name,products.category,order_details.order_date
          from order_details 
          join users on order_details.user_id = users.id
          join products on order_details.product_id = products.id
          where order_details.user_id = #{user_id}
          limit #{EXPORT_LIMIT}
          offset #{offset}
        "
      end

      def self.count_query_builder(user_id)
        "select count(*) from order_details where user_id = #{user_id}"
      end
    end
  end
end
