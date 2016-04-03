class CreateSeries < ActiveRecord::Migration
  def change
    create_table :series do |t|
      t.references :user, index: true, foreign_key: true
      t.references :pool, index: true, foreign_key: true
      t.string :away_team_id
      t.string :home_team_id
      t.integer :away_team_wins
      t.integer :home_team_wins
      t.string :round
      t.integer :next_round_competitor_series_id
      t.integer :points_awarded

      t.timestamps null: false
    end
  end
end
