class ApplicationController < ActionController::Base
  #protect_from_forgert with :exception
  include SessionsHelper

  private

  # confirms a user is logged in
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
end
