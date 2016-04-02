class PicksController < ApplicationController

  def index
    @round_one_picks = Pick.for_round('1', current_user)
    @east_series     = Series.round_one_for('East')
    @west_series     = Series.round_one_for('West')
    @round_two_picks = Pick.for_round('2', current_user)
  end

  def new
    @pick = current_user.picks.build
  end

  def create
    @pick = current_user.picks.build(picks_params)

    if @pick.save
      redirect_to picks_path
    else
      flash[:error] = "There was a problem saving your pick.  Please try again."
      render :new
    end
  end

  def edit
    @pick = Pick.find(params[:id])
  end

  def update
    @pick = Pick.find(params[:id])

    if @pick.update!(picks_params)
      redirect_to picks_path
    else
      flash[:error] = "There was a problem updating our pick.  Please try again."
      render :edit
    end
  end

  private

  def picks_params
    params.require(:pick).permit(:user_id, :series_id, :away_team_wins, :home_team_wins, :points_awarded, :pool_id)
  end

end
