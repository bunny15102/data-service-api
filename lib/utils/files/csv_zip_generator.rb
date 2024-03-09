require 'csv'
require 'zip'
require 'helper/query_executor'

module Utils
  module File
    class CsvZipGenerator
      def self.generate(queries,zip_file_name)
        Zip::File.open("#{Rails.root}/tmp/#{zip_file_name}", Zip::File::CREATE) do |zipfile|
          queries.each do |hash|
            query = hash["query"]
            headers = hash["headers"]
            filename = hash["filename"]

            zipfile.get_output_stream(filename) do |csv_stream|
              csv_content = CSV.generate do |csv|
                csv << headers
                Helper::QueryExecutor.select_rows(query).each do |row|
                  csv << row
                end
              end
              csv_stream.write(csv_content)
            end
          end
        end
      end
    end
  end
end