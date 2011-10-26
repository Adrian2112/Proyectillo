# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Calmecac::Application.initialize!
#RAILS_ENV=production script/delayed_job start #Starts job_job delayed (dev: rake jobs:work)
