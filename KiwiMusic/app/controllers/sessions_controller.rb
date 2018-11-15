class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && BCrypt::Password.new(@user.password_digest).is_password?(params[:user][:password])
      login!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:error] = ['invalid credentials']
    end
  end

  def destroy
    session[:session_token] = nil
    render :new
  end

end
