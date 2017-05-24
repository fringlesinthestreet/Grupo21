class UsersController < ApplicationController

  def show
    if user_signed_in?
      @users = User.all
      @user = User.find(current_user.id)
    else
      redirect_to tv_shows_path
    end
  end

  def destroy
     @user = User.find(params[:id])

     if @user.destroy
         redirect_to :back, notice: "User deleted."
     end
   end

end
