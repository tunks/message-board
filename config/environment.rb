# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# Add Rails logger
Rails.logger = ActiveSupport::Logger.new(STDOUT)
# Rails.logger = ActiveSupport::Logger.new("log/#{Rails.env}.log")
