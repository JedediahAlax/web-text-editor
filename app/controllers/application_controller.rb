class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
  #protect_from_forgery with: :null_session
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
