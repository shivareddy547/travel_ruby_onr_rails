module Services
  module V1
    module User
      class Response

        ATTRIBUTES = [:user_serializer]

        attr_accessor :user,*ATTRIBUTES

        def initialize(options = {})
          assign_attributes(options.slice(*self.class::ATTRIBUTES))
        end

        def response
        {
            user: user
        }
        end

        def assign_attributes(options = {})
          options.slice(*self.class::ATTRIBUTES).each do |key, value|
            send("#{key}=", value)
          end
        end

      end
    end
  end
end