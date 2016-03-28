class Pick < ActiveRecord::Base
  belongs_to :user
  belongs_to :series
  belongs_to :pool

  validates :series_id, presence: true
  validates :away_team_wins, presence: true
  validates :home_team_wins, presence: true
  validates :user_id, presence: true
  # validates :pool_id, presence: true  ##TODO - uncomment once I figure out how to grab/set this...perhaps from the session?
end
