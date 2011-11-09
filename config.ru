# This file is used by Rack-based servers to start the application.

if ENV['RAILS_ENV'] == 'production'
  ENV['HOME'] = "/home/calmecaC"
  ENV['GEM_HOME'] = "/home/calmecac/.gems"
  ENV['GEM_PATH'] = "/home/calmecac/.gems:/usr/lib/ruby/gems/1.8"
end


require ::File.expand_path('../config/environment',  __FILE__)
run Calmecac::Application
