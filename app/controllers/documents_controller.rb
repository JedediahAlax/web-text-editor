class DocumentsController < ApplicationController
  before_action :logged_in_user, only: [ :create, :destroy, :edit]
  before_action :correct_user, only:  [:edit, :update, :show, :destroy]


def index
  redirect_to current_user
end


def new
  @user = current_user
  @document = current_user.documents.build if logged_in?
  gon.userDoc = @document
end

def edit
  @user = current_user
  @userDoc = @user.documents.find(params[:id])
  gon.userDoc = @userDoc
end

def update
  @document = Document.find(params[:id])
  if @document.update_attributes(document_params)
    flash.now[:sucess] = "Document Updated!"
  redirect_to current_user
  else
    flash.now[:danger] = "You must provide a title for your document."
    render 'edit'
  end
end


def create
  @document = current_user.documents.build(document_params)
  if @document.save
    flash[:success] = "Document saved!"
    redirect_to current_user
  else
    @user = current_user
    flash.now[:danger] = "You must provide a title for your document."
    render 'new'
  end
end

def destroy
end

private
def document_params
  params.require(:document).permit(:title, :content)
end

def correct_user
  @user = current_user
  redirect_to root_url unless current_user?(@user)
end








end
