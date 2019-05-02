class TextboxesController < ApplicationController


  def new

  end

  def textbox
  @user = current_user
  @document = current_user.documents.build if logged_in?
  end

  def home
    
  end





end
