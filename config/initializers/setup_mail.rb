ActionMailer::Base.smtp_settings = {
  :domain          => "contacto@calmecac.me", 
  :address         => 'calmecac.me',          
  :port            => 25,                                           
  :authentication  => :plain,                    
  :user_name       => 'contacto@calmecac.me', 
  :password        => 'Calmecac2011',            
  :enable_starttls_auto => false
}

ActionMailer::Base.default_url_options[:host] = "http://www.calmecac.me"
Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?