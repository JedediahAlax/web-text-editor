class DocumentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]





def new
end

def edit
end

def create
  @document = current_user.documents.build(document_params)
  if @document.save
    flash[:success] = "Document saved!"
    redirect_to current_user
  else
    render 'splash_page/home'
  end
end

def destroy
end

private
def document_params
  params.require(:document).permit(:title, :content)
end



end
