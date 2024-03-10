module Export
  module Strategy
    class AsyncExportStrategy
      def execute
        Export::ExportWorker.perform_async(user_id)
        return nil
      end
    end
  end
end