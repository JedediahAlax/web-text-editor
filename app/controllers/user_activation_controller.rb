class UserActivationController < ApplicationController


  def edit
    user = User.find_by(email: params[:email])

    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.update_attribute(:activated, true)
      user.update_attribute(:activated_at, Time.zone.now)
      log_in user
      flash[:success] = "Your Textitor account has been activated!"
      redirect_to user
    else
      flash[:danger] = "Oops! Your activation link is invalid."
      redirect_to root_url
    end
  end
end