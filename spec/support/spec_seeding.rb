require "#{Rails.root}/lib/all_nba_teams"


###########################  NBA Teams  ###########################

def seed_nba_teams
  all_teams = AllNbaTeams.team_details

  all_teams.each do |team|
    new_team = NbaTeam.new

    team.each do |attribute, value|
      new_team[attribute.to_sym] = value
    end

    new_team.save!
  end
end


###########################  Series  ###########################

def seed_initial_series
  divisions = ["Southeast", "Atlantic", "Central", "Southwest", "Northwest", "Pacific"]

  divisions.each do |div|
    Series.create!(
      away_team_id: NbaTeam.where(division: div).first.team_id,
      home_team_id: NbaTeam.where(division: div).last.team_id,
      round: "1"
    )
  end
end
