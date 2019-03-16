ActionMailer::Base.smtp_settings = {
    :user_name => ENV['MAIL_USER'],
    :password => ENV['MAIL_PASSWORD'],
    :domain => 'momoasmilfs.club',
    :address => ENV['MAIL_SERVER'],
    :port => ENV['MAIL_PORT'],
    :authentication => :plain,
    :enable_starttls_auto => true
}