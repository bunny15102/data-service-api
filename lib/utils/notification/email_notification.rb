module Utils
  module Notification
    class EmailNotification < ActionMailer::Base  
      def send_mail(subject, body, attachment_urls = nil)
        mail = add_mail_parameters(subject, body, attachment_urls)
        mail.deliver
      end

      def add_mail_parameters(subject, body, attachment_urls)
        attachment(attachment_urls) if attachment_urls.present?
        mail(
          from: EMAIL_ID,
          to: EMAIL_ID,
          subject: subject_content(subject),
          body: body_content(body)
        )
      end

      def body_content(content)
        content.present? ? content : "No Body in the email"
      end

      def subject_content(content)
        content.present? ? content : "No Subject"
      end

      def attachment(attachment_urls)
        attachment_urls.each do |file|
          attachments[File.basename(file)] = File.read(file)
        end
        return attachments
      end
    end
  end
end