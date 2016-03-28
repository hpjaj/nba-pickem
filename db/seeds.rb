require "#{Rails.root}/lib/all_nba_teams"

NbaTeam.destroy_all

all_teams = AllNbaTeams.team_details

all_teams.each do |team|
  new_team = NbaTeam.new

  team.each do |attribute, value|
    new_team[attribute.to_sym] = value
  end

  new_team.save!
end

p "Seeding complete"
p "Created #{NbaTeam.count} NBA teams"
