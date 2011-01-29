module ActionDispatch
  module Routing
     class MobileMatcher
      def initialize
      end

      def matches?(request)
        !request.parameters.fetch(:mobile_device, nil).nil?
      end
    end

  
  end
end