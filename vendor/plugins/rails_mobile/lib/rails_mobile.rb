module RailsMobilePlugin
  # namespace our plugin and inherit from Rails::Railtie
  # to get our plugin into the initialization process
  class Railtie < Rails::Railtie

    # configure our plugin on boot. other extension points such
    # as configuration, rake tasks, etc, are also available
    initializer "railsmobilenewplugin.initialize" do |app|
      require "rails_mobile/application"
      require "rails_mobile/mobile_dispatch/mobile_matcher"
      require "rails_mobile/mobile_dispatch/action_dispatch"
      require "rails_mobile/mobile_dispatch/categories"
      require "rails_mobile/mobile_dispatch/parameters"

    end

  end
end




