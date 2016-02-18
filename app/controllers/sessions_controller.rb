class SessionsController < ApplicationController
  # Show the login form
  def new
    redirect_to :root if logged_in?
  end
  # Authentication from login form
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    # authenticate is provided from gem
    if user && user.authenticate(params[:session][:password])
      log_in user
      if user.is_manager?
        redirect_to :incoming
      else
        redirect_to :root
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  # Signout action
  def destroy
    log_out if logged_in?
    redirect_to login_url
  end
end
