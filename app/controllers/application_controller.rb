class ApplicationController < ActionController::Base
  # before_filter :authenticate

  protect_from_forgery
  helper_method :current_user_session, :current_user

  def render_optional_error_file(status_code)
    if status_code == :not_found
      render_404
    else
      super
    end
  end
  
  def render_404
    respond_to do |type| 
      type.html { render :file => "public/404.html", :status => 404 } 
      type.all  { render :nothing => true, :status => 404 } 
    end
    true  # so we can do "render_404 and return"
  end

  private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end
    
  protected
    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == "developer" && password == "depuwatch"
      end
    end
end
