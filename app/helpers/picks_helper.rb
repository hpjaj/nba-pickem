module PicksHelper

  def completed_pick(picks, game)
    picks.where(series_id: game.id)
      .where.not(home_team_wins: nil)
      .where.not(away_team_wins: nil)
      .first || nil
  end

end
