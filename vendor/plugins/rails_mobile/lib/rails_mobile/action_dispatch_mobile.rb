module ActionDispatch
  module Routing
    
    class MobileMatcher
      def initialize
      end

      def matches?(request)
        !request.parameters.fetch(:mobile_device, nil).nil?
      end
    end

    class Mapper

      def match(*args)
        options = nil
        path = nil
        if args.size == 1 && args.last.is_a?(Hash)
          options  = args.pop
          path, to = options.find { |name, value| name.is_a?(String) }
          options.merge!(:to => to).delete(path)

        else
          path = args.shift
          options  = args.pop

        end
        if options.nil?
          super path
        else
          if options.fetch(:classifier,nil).nil?
            super path,options
          else
            
            mobile_only = options.fetch(:mobile_only,false)
            
            if mobile_only 
              options.update({:constraints => MobileMatcher.new})
            end
            
            options.update({:to => mobile_dispatch(path,options) })
            super path.gsub(/\$/,''), options
          end
        end
        
      end

   

      private

      
      def mobile_dispatch(path,options)
        original_to = options.fetch(:to,nil)
        if original_to.nil?
          original_to = path.gsub(/\//, '#')
        end
        classifier = options.fetch(:classifier)
        

        proc do |env|
 
          device  = mobile_device env
          to_str = original_to.gsub(/\$/,'')
          
          unless device.nil?
            classifier_method = method(classifier)
            device_category = classifier_method.call(device)
            to_str = original_to.gsub(/\$/,device_category)
          end
          
          controller_name,action_name = to_str.split('#')
          controller = controller_reference(controller_name)
        
          controller.action(action_name).call(env)
         
        end
      end
      def controller_reference(controller_param)
        controller_name = "#{controller_param.camelize}Controller"
        controller = ActiveSupport::Dependencies.ref(controller_name)        
        controller.get
      end
      def mobile_device(env)
        env.fetch "action_dispatch.request.mobile_device",nil
       
      end
    end
  end

  
end

module MobileDispatch
  class Categories
    
    def self.add(&block)
      class << ActionDispatch::Routing::Mapper
        yield
      end
    end
  end


end

module ActionDispatch
  module Http
    module Parameters
      # Returns both GET and POST \parameters in a single hash.
      def parameters
        @env["action_dispatch.request.parameters"] ||= begin
          params = request_parameters.merge(query_parameters)
          params.merge!(path_parameters)
          unless mobile_device_paramter.nil?
            params.merge!(mobile_device_paramter)
          end
          encode_params(params).with_indifferent_access
        end
      end

      def mobile_device_paramter
        @env["action_dispatch.request.mobile_device"]
      end
    end
  end
end
