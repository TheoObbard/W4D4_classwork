class UsersController < ApplicationController

  def new
    #i think this is where you set session token to current session_token
    #as is new session token, aka they are logged in
  end

  def create
    #i think this is where you add a new user
    #will prob need to reroute to some other view
    user = User.new(params[:email, :password_digest])
    if user.save!
      login!(user)
      # redirect_to somewhere...
    else
      flash.now[:error] = ['oops something went wrong, try again']
    end
  end

  def show

  end

end
