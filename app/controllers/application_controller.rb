# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  layout 'basic'

  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  filter_parameter_logging :password
  include AuthModule
  helper_method :current_user, :admin_page?


  def admin_required
    authenticate_or_request_with_http_basic do |username, password|
      username == "George" && password == "Gallup"
    end
    @admin_page = true
  end

  def admin_page?
    @admin_page == true
  end
end
