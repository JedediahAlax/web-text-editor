class UsersController < ApplicationController
  # require users to be logged in AND to be correct user to access edit and update actions
  before_action :logged_in_user, only: [:index, :edit, :update, :show, :destroy]
  before_action :correct_user, only:  [:edit, :update, :show, :destroy]


  def index
    redirect_to current_user
  end


  def show

    @user = User.find(params[:id])
    @documents = @user.documents.paginate(page: params[:page])
    @document = current_user.documents.build if logged_in?

  end


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
      # log in user after signup
      #log_in @user
      #flash[:success] = "Welcome to Textitor!!"
      #redirect_to @user
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

  # This will find the user by ID and delete from the database. Redirect to splash page
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "You have successfully deleted your account."
    redirect_to root_url
  end



  private

  def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


  def correct_user
    @user = User.find(params[:id])
    redirect_to root_url unless current_user?(@user)

  end






end
