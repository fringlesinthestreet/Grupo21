class TvShowsController < ApplicationController
  ## Si queremos para para que solo usuarios logeados tengan acceso:
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_tv_show, only: [:edit, :update, :destroy]

  # GET /tv_shows
  # GET /tv_shows.json

  def index
    @tv_shows = TvShow.all
    if user_signed_in?
      if current_user.child?
        @my_tv_shows = TvShow.where(["user_id = :u", {u: current_user.following[0].id}])
      else
        @my_tv_shows = TvShow.where(["user_id = :u", {u: current_user.id}])
      end
    end
  end

  # GET /tv_shows/1
  # GET /tv_shows/1.json
  def show
    @tv_show = TvShow.find(params[:id])
    if not @tv_show.user.admin?
      if user_signed_in?
        if current_user.id != @tv_show.user_id
          if current_user.child?
            if @tv_show.user.id != current_user.following[0].id
              redirect_to tv_shows_path
            end
          else
            redirect_to tv_shows_path
          end
        end
      end
    end

  end

  # GET /tv_shows/new
  def new
    ## Lo cambie.. antes era esto:
    ## @tv_show = TvShow.new
    if current_user.child?
      redirect_to tv_shows_path
    end
    @tv_show = current_user.tv_shows.build
  end

  # GET /tv_shows/1/edit
  def edit
    # Must check if the one editing is the Admin or Owner
    if not current_user.admin?
      if current_user.id != @tv_show.user_id
        redirect_to tv_shows_path
      end
      if current_user.child?
        redirect_to tv_shows_path
      end
    end

  end

  # POST /tv_shows
  # POST /tv_shows.json
  def create
    ## Lo cambie.. antes era esto:
    ## @tv_show = TvShow.new(tv_show_params)
    @tv_show = current_user.tv_shows.build(tv_show_params)

    respond_to do |format|
      if @tv_show.save
        format.html { redirect_to @tv_show, notice: 'Tv show was successfully created.' }
        format.json { render :show, status: :created, location: @tv_show }
      else
        format.html { render :new }
        format.json { render json: @tv_show.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tv_shows/1
  # PATCH/PUT /tv_shows/1.json
  def update
    respond_to do |format|
      if @tv_show.update(tv_show_params)
        format.html { redirect_to @tv_show, notice: 'Tv show was successfully updated.' }
        format.json { render :show, status: :ok, location: @tv_show }
      else
        format.html { render :edit }
        format.json { render json: @tv_show.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tv_shows/1
  # DELETE /tv_shows/1.json
  def destroy
    if @tv_show.user == current_user or current_user.admin?
      @tv_show.destroy
      respond_to do |format|
        format.html { redirect_to tv_shows_url, notice: 'Tv show was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

def following
  @title = "Following"
  @tvshow  = TvShow.find(params[:id])
  @categories = @tvshow.following.paginate(page: params[:page])
  #render 'show_follow'
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tv_show
      @tv_show = TvShow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tv_show_params
      params.require(:tv_show).permit(:name, :genre, :country, :language, :actors, :director, :seasons)
    end
end
