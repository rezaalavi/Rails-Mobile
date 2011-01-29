
require 'mobiles/device_locator'
class MobileFilter
  def initialize(app)
    @app = app
    
  end

  def call(env)
  
    user_agent =    env.fetch "HTTP_USER_AGENT",nil
    unless user_agent.nil?
      user_device = Mobiles::DeviceLocator.find_device_by_user_agent(user_agent)
      unless user_device.nil?
        params = env.fetch "action_dispatch.request.mobile_device",nil
        if params.nil?
          params = Hash.new
        end
        params.update :mobile_device => user_device

        env.update "action_dispatch.request.mobile_device" => params
        
      end
    end

 
    @app.call(env)
    
  end
end
