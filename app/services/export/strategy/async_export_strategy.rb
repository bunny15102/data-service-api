module Export
  module Strategy
    class AsyncExportStrategy < ExportStrategy
      def execute
        Export::ExportWorker.perform_async(user_id)
        return nil
      end
    end
  end
end