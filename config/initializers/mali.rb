Rails.env.production?
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address: 'smtp.gmail.com',
  domain: 'gmail.com',
  port: 587,
  user_name: 'rails.test2021@gmail.com',
  password: 'test202104',
  authentication: 'plain',
  enable_starttls_auto: true
}