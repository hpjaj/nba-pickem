class CreateSeries < ActiveRecord::Migration
  def change
    create_table :series do |t|
      t.string :away_team_id
      t.string :home_team_id
      t.integer :away_team_wins
      t.integer :home_team_wins
      t.string :round

      t.timestamps null: false
    end
  end
end
