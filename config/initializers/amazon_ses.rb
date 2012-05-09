ActionMailer::Base.add_delivery_method :ses, AWS::SES::Base,
  :access_key_id     => Settings.aws.access_key_id,
  :secret_access_key => Settings.aws.secret_access_key

if ENV['DKIM_SECRET_KEY']
  Dkim::domain      = 'watchdog.net'
  Dkim::selector    = 'mail'
  Dkim::private_key = ENV['DKIM_SECRET_KEY']

  Dkim::signable_headers = Dkim::DefaultHeaders - \
      %w{Message-ID Resent-Message-ID Date Return-Path Bounces-To}

  ActionMailer::Base.register_interceptor('Dkim::Interceptor')
end
