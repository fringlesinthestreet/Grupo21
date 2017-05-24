class HomeController < ApplicationController
  ## Si queremos para para que solo usuarios logeados tengan acceso:
  ## before_action :authenticate_user!
  ## before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
      redirect_to tv_shows_path
  end
end
