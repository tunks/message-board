class UsersController < ApplicationController
    skip_before_action :authenticate_user!, unless: :user_signed_in?

  # include ErrorHandler

  # before_action :authenticate_user!
  ## rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  #   def index
  #       @users = User.all
  #   end

  def new
      logger.debug "Fetch new user object"
      @user = User.new
  end

  # Get and return user details
  # GET /users/:id
  #
  def show
     @user = User.find(params[:id])
  end

  def create
      @user = User.new(users_params)
      logger.info(users_params)
      if @user.save
         redirect_to root_path, notice: "User successfully saves"
      else
         logger.debug "#### Save  error #{@user.errors.full_messages}"
         render :new, status: :unprocessable_entity
      end
     rescue ActiveRecord::RecordNotSaved => err
        logger.error "Save  error #{err}"
        render :new, status: :unprocessable_entity
  end


  private
  # User request params
  # returns return request paramters
  def users_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  # def record_not_found
  #     puts "######User.record_not_found called()"
  #    logger.error "Active record not found, id: #{params[:id]}"
  #    render partial: "/layouts/partials/errors/404", status: :not_found
  # end
end
