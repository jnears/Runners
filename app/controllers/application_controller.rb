class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper #by default all helpers are available in any views but not controllers - therefore we call the sessionshelper from the application helper
end