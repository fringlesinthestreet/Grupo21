class UsersController < ApplicationController

  def show
    if user_signed_in?
      @users = User.all
      @user = User.find(current_user.id)
    else
      redirect_to tv_shows_path
    end
  end

end
