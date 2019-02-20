module SessionsHelper
  # Logs in the user
  def log_in(user)
    # places a temporary cookie on user's browser w/ encrpyted version of user id
    session[:user_id] = user.id
  end

  # return current logged in user (if any)
  def current_user
    # will return nil if the id is invalid
    if session[:user_id]
      # find_by only gets executed if @current_user hasnt yet been assigned
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  # returns true if the user is logged in, otherwise will return false
  def logged_in?
    !current_user.nil?
  end

  #Logs out the current users
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  

end
