module ActionDispatch
  module Routing
    
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
        puts "controller_name #{controller_name}"
        controller = ActiveSupport::Dependencies.ref(controller_name)        
        controller.get
      end
      def mobile_device(env)
        env.fetch "action_dispatch.request.mobile_device",nil       
      end
    end
  end

  
end



