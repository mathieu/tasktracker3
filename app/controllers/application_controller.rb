class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery
  layout 'application'
  before_filter :authenticate_user!
end
