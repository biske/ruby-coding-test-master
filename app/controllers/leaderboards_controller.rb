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
    @rankings = @leaderboard
      .entries
      .group(:username)
      .order('sum_score DESC')
      .sum(:score)
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
    previous_position = CalculatePosition.run(leaderboard: @leaderboard, username: params[:username])
    @leaderboard_entry = @leaderboard.entries.build(leaderboard_entry_params)
    
    if @leaderboard_entry.save
      new_position = CalculatePosition.run(leaderboard: @leaderboard, username: params[:username])
      
      if previous_position
        positions_gained = previous_position - new_position 
        notice = "#{params[:username]} gained #{positions_gained} #{'position'.pluralize(positions_gained)}"
      else
        notice = "You are on #{new_position} position!"
      end
      redirect_to @leaderboard, notice: notice
    else
      render :show
    end
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

  def leaderboard_entry_params
    params.permit(:username, :score)
  end
end
