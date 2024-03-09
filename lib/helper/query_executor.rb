module Helper
  class QueryExecutor
    def self.select_rows(query)
      ActiveRecord::Base.connection.select_rows(query)
    end

    def self.select_value(query)
      ActiveRecord::Base.connection.select_value(query)
    end
  end
end