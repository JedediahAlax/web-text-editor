class UsersController < ApplicationController
  # require users to be logged in to access edit and update actions
  before_action :logged_in_user, only: [:edit, :update, :show]
  before_action :correct_user, only: [:edit, :update, :show]



  def show
    @user = User.find(params[:id])
    #debugger
  end


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # log in user after signup
      log_in @user
      flash[:success] = "Welcome to Textitor!!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # handle successful update
      flash[:success] = "Nice! Your profile has been updated!"
      redirect_to @user
    else
      render 'edit'
    end
  end



  private def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
          end

  # if user is not logged in redirect to login page
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to root_url unless current_user?(@user)

  end






end
