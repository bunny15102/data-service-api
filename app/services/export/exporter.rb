require 'helper/query_executor'
require 'utils/files/csv_zip_generator'

module Export
  class Exporter
    attr_accessor :user, :zip_file_name
    def initialize(user_id)
      @user = User.find_by_id(user_id)
      @zip_file_name = "#{user.user_name}_orders.zip"
    end

    def export
      csv_count = FILE_NO
      offset = EXPORT_OFFSET
      file_and_query_mapping = Array.new
      count_query = Export::Query::Builder.count_query_builder(user.id) 
      count = Helper::QueryExecutor.select_value(count_query)
      p count
      p offset

      while offset < count
        csv_filename = get_csv_filename(csv_count)
        data_query = Export::Query::Builder.data_query_builder(user.id,offset)
        file_and_query_mapping << {"filename" => csv_filename, "query" => data_query, "headers" => EXPORT_CSV_HEADER}
        csv_count +=1
        offset += EXPORT_LIMIT
      end

      Utils::File::CsvZipGenerator.generate(file_and_query_mapping,zip_file_name)
    end

    def get_csv_filename(csv_count)
      "#{user.user_name}_orders_#{csv_count}.csv"
    end
  end
end

