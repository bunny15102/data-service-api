module Export
  module Strategy
    class SyncExportStrategy < ExportStrategy
      def execute
        export_instance = Export::Exporter.new(user_id)
        export_instance.export
        
        return export_instance.zip_file_name
      end
    end
  end
end