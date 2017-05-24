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

     @tv_shows = TvShow.all
     @tv_shows.each do |t|
       if t.user_id.to_s == :id.to_s
         t.destroy
       end
     end

     if @user.destroy
         redirect_to :back, notice: "User deleted."
     end
   end

end
