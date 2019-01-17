class LeaderboardsController < ApplicationController
  before_action :set_leaderboard, only: [:edit, :update, :destroy, :add_score]

  # GET /leaderboards
  def index
    @leaderboards = Leaderboard.all
  end

  # GET /leaderboards/1
  def show
    # No big gain here since there are 2 queries currently but it's by convention to preload data in controller
    @leaderboard = Leaderboard.includes(:entries).find(params[:id])
  end

  # GET /leaderboards/new
  def new
    @leaderboard = Leaderboard.new
  end

  # GET /leaderboards/1/edit
  def edit
  end

  # POST /leaderboards
  def create
    @leaderboard = Leaderboard.new(leaderboard_params)

    if @leaderboard.save
      redirect_to @leaderboard, notice: 'Leaderboard was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /leaderboards/1
  def update
    if @leaderboard.update(leaderboard_params)
      redirect_to @leaderboard, notice: 'Leaderboard was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /leaderboards/1
  def destroy
    @leaderboard.destroy
    redirect_to leaderboards_url, notice: 'Leaderboard was successfully destroyed.'
  end

  def add_score
    username = params[:username]
    score    = params[:score]
    if @leaderboard.entries.where(username: username).exists?
      entry = @leaderboard.entries.where(username: username).first
      entry.with_lock do
        entry.update(score: score.to_i + entry.score)
      end
    else
      @leaderboard.entries.create(username: username, score: score)
    end
    redirect_to @leaderboard, notice: 'Score added'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_leaderboard
    @leaderboard = Leaderboard.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def leaderboard_params
    params.require(:leaderboard).permit(:name)
  end
end
