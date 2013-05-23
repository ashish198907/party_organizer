# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :current_event

  def current_event
    @current_event = Event.find_by_current_event(true)
  end
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
