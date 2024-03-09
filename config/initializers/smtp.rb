ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.smtp_settings = {
  :address => 'smtp.elasticemail.com',
  :port => 2525,
  :authentication => 'login',
  :user_name => 'bunny.praveshn@gmail.com',
  :password => '97B161B9474E846188F78CCE0FD898551277'
}