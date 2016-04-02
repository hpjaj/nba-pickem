class PicksController < ApplicationController

  def index
    @picks       = current_user.picks
    @east_series = Series.joins('INNER JOIN nba_teams ON nba_teams.team_id = series.away_team_id').where('nba_teams.conference = ?', 'East').where(round: '1')
    @west_series = Series.joins('INNER JOIN nba_teams ON nba_teams.team_id = series.away_team_id').where('nba_teams.conference = ?', 'West').where(round: '1')
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

  private

  def picks_params
    params.require(:pick).permit(:user_id, :series_id, :away_team_wins, :home_team_wins, :points_awarded, :pool_id)
  end

end
