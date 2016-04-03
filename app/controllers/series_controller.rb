class SeriesController < ApplicationController

  def index
    @east_series     = Series.for(current_user, Series::ROUNDS.first, 'East')
    @west_series     = Series.for(current_user, Series::ROUNDS.first, 'West')

    @round_one_east_picks     = @east_series.where('home_team_wins IS NOT null').where('away_team_wins IS NOT null')
    @round_one_west_picks     = @west_series.where('home_team_wins IS NOT null').where('away_team_wins IS NOT null')
  end

  def new
    @series = current_user.series.build
  end

  def create
    @series = current_user.series.build(series_params)

    if @series.save
      redirect_to series_index_path
    else
      flash[:error] = "There was a problem saving your pick.  Please try again."
      render :new
    end
  end

  def edit
    @series = Series.find(params[:id])
  end

  def update
    @series = Series.find(params[:id])

    if @series.update(series_params)
      redirect_to series_index_path
    else
      flash[:error] = "There was a problem updating our pick.  Please try again."
      render :edit
    end
  end

  private

  def series_params
    params.require(:series).permit(:user_id, :away_team_wins, :home_team_wins, :points_awarded, :pool_id, :next_round_competitor_series_id, :away_team_id, :home_team_id, :round)
  end

end
