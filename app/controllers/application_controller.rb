class ApplicationController < ActionController::Base
  #protect_from_forgert with :exception
  include SessionsHelper
end
