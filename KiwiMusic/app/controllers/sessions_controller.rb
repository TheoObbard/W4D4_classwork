class SessionsController < ApplicationController

  def new
    redirect_to new_session_url
  end

  def create
    user = User.find_by(email: params[:user][:email])
    if userm && BCrypt::Password.new(user.password_digest).is_password?(params[:user][:password])
      login!(user)
      redirect_to users_url(user.id)
    else
      flash.now[:error] = ['invalid credentials']
    end
  end

  def destroy

  end


end
