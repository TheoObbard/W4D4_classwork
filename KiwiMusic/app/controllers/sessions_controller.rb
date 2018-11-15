class SessionsController < ApplicationController

  def new
    render :new
    #logic that would say if you are logged in already to to somewhere
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && BCrypt::Password.new(user.password_digest).is_password?(params[:user][:password])
      login!(@user)
      redirect_to user_url(@user.id)
    else
      flash.now[:error] = ['invalid credentials']
    end
  end

  def destroy
    @user.session_token = nil
    session[:session_token] = nil
  end


end
