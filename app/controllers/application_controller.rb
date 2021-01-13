class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  helper_method :is_admin?

  def after_sign_in_path_for(resource)
    if is_admin?
      admin_root_path
    else
      root_path
    end
  end

  protected

  def find_test
    @test = Test.find(params[:id])
  end

  def is_admin?
    current_user.is_a?(Admin)
  end
end
