# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
EdAlbum::Application.initialize!
ActionMailer::Base.delivery_method = :smtp
#ActionMailer::Base.content_type = "text/html"
# ActionMailer::Base.server_settings = {
#    :address => "",
#    :port => 25,
#    :domain => "",
#    :authentication => :login,
#    :user_name => "",
#    :password => "",
# }

