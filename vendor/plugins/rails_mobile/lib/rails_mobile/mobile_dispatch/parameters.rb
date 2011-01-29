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
