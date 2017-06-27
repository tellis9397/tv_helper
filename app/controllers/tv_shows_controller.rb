class TvShowsController < ApplicationController
  before_action :set_tv_show, only: [:show, :edit, :update, :destroy]

  # GET /tv_shows
  # GET /tv_shows.json
  def index
    @tv_shows = TvShow.all
  end

  # GET /tv_shows/1
  # GET /tv_shows/1.json
  def show
  end

  # GET /tv_shows/new
  def new
    @tv_show = TvShow.new
  end

  # GET /tv_shows/1/edit
  def edit
  end

  # POST /tv_shows
  # POST /tv_shows.json
  def create
    show_title = params[:title]
    @tv_shows = TvShow.where("title LIKE '%#{show_title}%'").to_a

    if @tv_shows.empty?
      show_info = ShowSearch.get_new_show(show_title)
      @tv_shows << TvShow.create(
        title: show_info[:title].gsub('+', ' '),
        info: show_info[:plot],
        total_seasons: show_info[:total_seasons],
        total_episodes: show_info[:total_episodes]
      )
    end

    redirect_to new_user_show_path(user: params[:user_id], tv_shows: @tv_shows)
  end

  # PATCH/PUT /tv_shows/1
  # PATCH/PUT /tv_shows/1.json
  def update
  end

  # DELETE /tv_shows/1
  # DELETE /tv_shows/1.json
  def destroy
    user = @tv_show.user
    @tv_show.destroy
    respond_to do |format|
      format.html { redirect_to user_path(user), notice: 'Tv show was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tv_show
      @tv_show = TvShow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tv_show_params
      params.require(:tv_show).permit(:title, :user_id)
    end
end
