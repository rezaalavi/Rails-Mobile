require File.expand_path('../mobile_filter',  __FILE__)

require 'rails/all'

class  Rails::Application
    config.middleware.use "MobileFilter"
end
