class SessionsController < ApplicationController
  before_action :logged_in_user, only: [:destroy]

  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = "Invalid email/password combination"
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to root_path
  end
  
  private
    def logged_in_user
      unless logged_in?
        flash[:error] = "You must be logged in to access this action"
        redirect_to login_url
      end
    end
end
