class SessionsController < ApplicationController
  before_action :redirect_authenticated!, only: [ :new, :create ], if: :user_signed_in?
  skip_before_action :authenticate_user!, unless: :user_signed_in?
  def new
  end

  def create
     @user = User.find_by(email: params[:email])
     # if @user && @user.authenticate(params[:password])
     if @user&.authenticate(params[:password])
        login(@user)
        logger.info("User login successful")
        redirect_to root_path
     else
        flash[:error] = "Invalid email or password"
        logger.error("Invalid user email or password")
        render :new, status: :unprocessable_entity
     end
  rescue ActiveRecord::ActiveRecordError => error
    logger.error ("User login error #{error}")
    render :new, status: :unprocessable_entity
  end

  def destory
      logout
      redirect_to root_path
  end
end
