class SessionsController < ApplicationController
  def new
  end

  # find user by provided email and password to log in
  def create
    # get user from database by submitted email address
    user = User.find_by(email: params[:session][:email].downcase)

    # if the user is found in database AND the password is correct for that user we log in.
    if user && user.authenticate(params[:session][:password])
      # log user in and redirect to where ever appropriate
    else
      # user was not found in database OR password submitted to user was invalid. no log in :(
      flash.now[:danger] = "Invalid email and/or password."
      render 'new'
    end
  end


  def destroy

  end

end
