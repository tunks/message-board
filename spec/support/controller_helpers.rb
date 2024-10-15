module Support
    module ControllerHelpers
      def user_login(user)
        puts "ControllerHelpers user_login"
        post login_path, params: { email: user.email, password: user.password }
        puts "Request logged in"
      rescue Exception => error
       puts "ControllerHelpers  error #{error}"
       # secret = Rails.application.secrets.json_web_token_secret
       # encoding = 'HS512'

       # request.headers["Authorization"] =
       # JWT.encode({ user_id: user.id }, secret, encoding)
     end
    end
end
