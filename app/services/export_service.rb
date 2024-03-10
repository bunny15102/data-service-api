class ExportService
  attr_accessor :export_type

  def initialize
    @export_type = nil
  end

  def select_export_strategy(user_id)
    if should_export_sync?
      @export_type = "sync"
      Export::Strategy::SyncExportStrategy.new(user_id)
    else
      @export_type = "async"
      Export::Strategy::AsyncExportStrategy.new(user_id)
    end
  end

  def should_export_sync?
    false
  end
end