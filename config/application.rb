$:.unshift File.dirname(__FILE__)

require 'boot'

module Application
  include ActiveSupport::Configurable
end

Application.configure do |config|
  config.root = [File.dirname(__FILE__), ".."].join("/")
  config.env  = ActiveSupport::StringInquirer.new(ENV['RACK_ENV'] || "development")
end

Bundler.require :default, Application.config.env

# Load specific environments
specific_environment = "../environments/#{Application.config.env}.rb"
require specific_environment if File.exists? specific_environment

def include_files(path)
  files = "#{Application.config.root}#{path}/*.rb"
  Dir[files].each {|f| require f}
end

# Require public API files
include_files("/app/api")

require File.expand_path('../../app/api.rb', __FILE__)
