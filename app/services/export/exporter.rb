require 'utils/files/csv_zip_generator'

class Exporter
  attr_accessor :user, :zip_file_name
  def initialize(user_id)
    @user = User.find_by_id(user_id)
    @zip_file_name = "#{user.name}_orders.zip"
  end

  def export
    csv_count = FILE_NO
    offset = EXPORT_OFFSET
    file_and_query_mapping = Array.new
    count = Export::Query::Builder.count_query_builder(user.id) 

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
    "#{user.name}_orders_#{csv_count}.csv"
  end
end
