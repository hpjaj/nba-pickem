class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.references :user, index: true, foreign_key: true
      t.references :series, index: true, foreign_key: true
      t.integer :away_team_wins
      t.integer :home_team_wins
      t.integer :points_awarded

      t.timestamps null: false
    end
  end
end
