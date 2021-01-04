class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      if session[:destination]&.empty?
        redirect_to session[:destination]
        session[:destination].clear
      else
        redirect_to tests_path
      end
    else
      flash.now[:alert] = 'Could not find such a user'
      render :new
    end
  end

  def destroy
    reset_session
    render :new
  end
end
