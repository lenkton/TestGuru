class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      
      redirect_to original_destination
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
