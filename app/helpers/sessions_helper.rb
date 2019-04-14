module SessionsHelper
  # Logs in the user
  def log_in(user)
    # places a temporary cookie on user's browser w/ encrpyted version of user id
    session[:user_id] = user.id
  end

  # remembers a user in a persistent session
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end


  # return true if the given user is the current users
  def current_user?(user)
    user == current_user
  end

  # return current logged in user (if any)
  def current_user
    # will return nil if the id is invalid
    if (user_id = session[:user_id])
      # find_by only gets executed if @current_user hasnt yet been assigned
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(:remember, cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  # returns true if the user is logged in, otherwise will return false
  def logged_in?
    !current_user.nil?
  end

  # forget a persisten session
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end


  #Logs out the current users
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end


end
