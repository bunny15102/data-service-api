class ExportService
  attr_accessor :strategy

  def initialize
    @strategy = nil
  end

  def select_export_strategy(user_id)
    if should_export_sync?
      strategy = "sync"
      Export::Strategy::SyncExportStrategy.new(user_id)
    else
      strategy = "async"
      Export::Strategy::AsyncExportStrategy.new(user_id)
    end
  end

  def should_export_sync?
    false
  end

  def render_export_message(zip_file)
    if export_strategy == "sync"
      send_data(File.read("#{Rails.root}/tmp/#{zip_file}"), type: 'application/zip', filename: zip_file)
    else
      render json: { status: 'success', message: ASYNC_RENDER_MESSAGE }
    end
  end
end