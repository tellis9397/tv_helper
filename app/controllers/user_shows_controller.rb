class UserShowsController < ApplicationController
  before_action :set_user_show, only: [:show, :edit, :update, :destroy]

  # GET /user_shows
  # GET /user_shows.json
  def index
    @user_shows = UserShow.where(user_id: params[:user_id])
  end

  # GET /user_shows/1
  # GET /user_shows/1.json
  def show
  end

  # GET /user_shows/new
  def new
    @user_show = UserShow.new
    @tv_shows = get_tv_shows(params[:tv_shows])
    @user_id = params[:user]
  end

  # GET /user_shows/1/edit
  def edit
  end

  # POST /user_shows
  # POST /user_shows.json
  def create
    @user = User.find(params[:user_id])
    @tv_show = TvShow.find(params[:tv_show])
    show_title = @tv_show.title

    @user_show = UserShow.create(
      user_id: @user.id,
      tv_show_id: @tv_show.id,
      title: @tv_show.title,
      current_season: 1,
      current_episode: 1,
      total_seasons: @tv_show.total_seasons,
      total_episodes: @tv_show.total_episodes
    )
    @user.user_shows << @user_show

    respond_to do |format|
      if @user_show.save
        format.html { redirect_to @user_show, notice: 'Tv show was successfully added.' }
        format.json { render :show, status: :created, location: @user_show }
      else
        format.html { render :new }
        format.json { render json: @user_show.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_shows/1
  # PATCH/PUT /user_shows/1.json
  def update
    respond_to do |format|
      if @user_show.update(user_show_params)
        format.html { redirect_to @user_show, notice: 'Tv show was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_show }
      else
        format.html { render :edit }
        format.json { render json: @user_show.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_shows/1
  # DELETE /user_shows/1.json
  def destroy
    user = @user_show.user
    @user_show.destroy
    respond_to do |format|
      format.html { redirect_to user_path(user), notice: 'Tv show was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_show
      @user_show = UserShow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_show_params
      params.require(:user_show).permit(:title, :user_id)
    end

    def get_tv_shows(tv_shows)
      TvShow.where(id: tv_shows).to_a
    end
end
