class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  helper_method :current_user,
                :logged_in?

  protected

  def original_destination
    session[:original_destination] || root_path
  end

  private

  def authenticate_user!
    unless logged_in?
      session[:original_destination] = self.url_for
      redirect_to login_path, alert: 'This resource requires authentication'
    end
  end

  def current_user
    @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    current_user.present?
  end
end
