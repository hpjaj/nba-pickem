class Series < ActiveRecord::Base
  ROUNDS = ['1', '2', 'conference_finals', 'finals']

  belongs_to :user
  belongs_to :pool

  validates :round, presence: true
  validates :away_team_wins, presence: true, on: :update
  validates :home_team_wins, presence: true, on: :update
  validates :user_id, presence: true
    self
      .joins('INNER JOIN nba_teams ON nba_teams.team_id = series.away_team_id')
      .where('nba_teams.conference = ?', conference)
      .where(round: '1')
  end
end
