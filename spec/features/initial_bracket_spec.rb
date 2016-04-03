require 'rails_helper'

describe "What the bracket should initially contain" do

  include Warden::Test::Helpers
  Warden.test_mode!

  let(:user) { create :user }

  before do
    sign_in(user)
  end

  context "with no seeding" do
    it "should safely render the picks index page" do
      visit series_index_path
      expect(current_path).to eq series_index_path
    end
  end

  context "with NBA Teams and Series seeded" do
    before do
      seed_nba_teams
      seed_initial_series
    end

    it "should display all the teams playing in the first round" do
      visit series_index_path

      Series.where(round: '1').each do |game|
        expect(page).to have_content(game.away_team_id.titleize)
        expect(page).to have_content(game.home_team_id.titleize)
      end
    end
  end

end
