class SessionsController < ApplicationController
  def new
  end

  # find user by provided email and password to log in
  def create
    # get user from database by submitted email address
    user = User.find_by(email: params[:session][:email].downcase)

    # if the user is found in database AND the password is correct for that user we log in.
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        message = "Your account is not yet activated."
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      # user was not found in database OR password submitted to user was invalid. no log in :(
      flash.now[:danger] = "Invalid email and/or password."
      render 'new'
    end
  end


  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
