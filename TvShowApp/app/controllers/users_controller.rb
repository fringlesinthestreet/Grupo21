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

  def create_follower
    # Aqui pongo cosas para evitar que cualquiera cree hijos

    if !user_signed_in?
      redirect_to tv_shows_path
    end

    if current_user.admin?
      redirect_to tv_shows_path
    end

    if current_user.child?
      redirect_to tv_shows_path
    end
    @user_new = User.new
    @user_new.email = current_user.email


  end

def watching
  @title = "Following"
  @user  = User.find(params[:id])
  @chapters = @user.watching.paginate(page: params[:page])
  #render 'show_follow'
end

  def auxiliar_page


    @variable = User.create(params[:user].permit(:email, :name, :password, :password_confirmation))
    @variable.child = true
    @variable.save!
    @variable.follow(current_user)

    redirect_to user_path



  end

end
