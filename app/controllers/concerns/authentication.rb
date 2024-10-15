module Authentication
     extend ActiveSupport::Concern

     included do
        before_action :current_user
        before_action :authenticate_user!
        helper_method :current_user
        helper_method :user_signed_in?
     end

     def login(user)
         session[:user_id] = user.id
         Current.user = user.id
     end

     def logout
         logger.info("logged out called")
         reset_session
     end

     def redirect_authenticated!
         redirect_to root_path, alert: "You have already signed in" if user_signed_in?
     end

     def authenticate_user!
        logger.info("authenticate_user! user is logged in #{user_signed_in?}")
        redirect_to login_path unless user_signed_in?
     end

     private
     #  Get current user session
     #
     def current_user
        logger.info("current_user called #{Current.user}")
        Current.user ||= User.find(session[:user_id]) if session[:user_id].present?
        rescue ActiveRecord::ActiveRecordError => error
        logger.error("current user is not found")
     end

     # Check if user is logged in
     def user_signed_in?
         Current.user.present?
     end
end
