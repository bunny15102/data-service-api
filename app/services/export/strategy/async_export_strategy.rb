module Export
  module Strategy
    class AsyncExportStrategy
      def execute
        Export::ExportWorker.set(queue: EXPORT_QUEUE).perform_async(user_id)
        return nil
      end
    end
  end
end