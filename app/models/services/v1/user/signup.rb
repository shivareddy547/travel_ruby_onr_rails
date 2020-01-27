module Services
  module V1
    module User
      class Signup

        ATTRIBUTES = [:email, :password, :first_name, :last_name, :gender]

        attr_accessor :user,*ATTRIBUTES

        def initialize(options = {})
          assign_attributes(options.slice(*self.class::ATTRIBUTES))
        end

        def create
          user = ::User.new(user_params)
          if user.save
            true
          else
            user.errors.full_messages.join(', ')
          end

        end

        def user_params
          {
              email: email,
              password: password,
              password_confirmation: password,
              team: ::Team.default_team
          }
        end

        def get_user_email
          ::User.find_by_email(email)
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