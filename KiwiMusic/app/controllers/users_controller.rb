class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    user = User.new(user_params)
    if user.save!
      login!(user)
      redirect_to user_url(user)
    else
      flash.now[:error] = ['oops something went wrong, try again']
    end
  end

  def show
    user = User.find_by(params[:id])
    render :show
  end

  def user_params
    params.require(:user).permit(:email, :password_digest)
  end

end
