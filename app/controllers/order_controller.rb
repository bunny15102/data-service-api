class OrderController < ApplicationController
  def index
    users_hash = User.all.to_json(only: [:id, :user_name, :email, :phone])

    render status: 200, json: users_hash
  end

  def download_orders
    export_service_instance = ExportService.new
    export_strategy = export_service_instance.select_export_strategy(params[:id].to_i)
    zip_file = export_strategy.execute

    render_export_message(export_service_instance, zip_file)
  end

  private 
  def render_export_message(export_service_instance, zip_file)
    if export_service_instance.export_type == "sync"
      send_data(File.read("#{Rails.root}/tmp/#{zip_file}"), type: 'application/zip', filename: zip_file)
    else
      render json: { status: 'success', message: ASYNC_RENDER_MESSAGE }
    end
  end
end