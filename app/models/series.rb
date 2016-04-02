class Series < ActiveRecord::Base
  has_many :picks
  def self.round_one_for(conference)
    self
      .joins('INNER JOIN nba_teams ON nba_teams.team_id = series.away_team_id')
      .where('nba_teams.conference = ?', conference)
      .where(round: '1')
  end
end
