ActionMailer::Base.smtp_settings = {
  :user_name => 'apikey',
  :password => Figaro.env.sendgrid_api_key,
  :domain => 'gorails.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}