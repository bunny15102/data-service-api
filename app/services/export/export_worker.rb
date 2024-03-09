require 'utils/notification/email_notification'

module Export
  class ExportWorker
    include Sidekiq::Worker
    sidekiq_options retry: 5,dead: true

    def perform(user_id)
      export_instance = Export::Exporter.new(user_id)
      export_instance.export
      zip_file_name = export_instance.zip_file_name
      move_zip_file(zip_file_name)
      send_email_notification(zip_file_name)
    end 

    def move_zip_file(export_instance)
      tmp_file_path = "#{Rails.root}/tmp/#{zip_file_name}"
      public_file_path = "#{Rails.root}/tmp/#{zip_file_name}"
      FileUtils.mv(tmp_file_path,public_file_path)
    end

    def send_email_notification(zip_file_name)
      mail_content = EXPORT_SUCCESS_MAIL
      report_link = REPORT_LINK % {filename: zip_file_name}
      subject = mail_content[:subject]
      body = mail_content[:body] % { report_link: report_link}
      Utils::Notification::EmailNotification.new.send_mail(subject, body)
    end
  end
end