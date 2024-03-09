class OrderController < ApplicationController
  def index
    users_hash = User.all.to_json(only: [:id, :user_name, :email, :phone])

    render status: 200, json: users_hash
  end

  def download_orders
    export_service_instance = ExportService.new
    export_strategy = export_service_instance.select_export_strategy(params[:id])
    zip_file = export_strategy.execute

    export_service_instance.render_export_message(zip_file)
  end
end