require 'rails_helper'

describe "Can sign into app" do

  include Warden::Test::Helpers
  Warden.test_mode!

  let(:user) { create :user }

  context "when not signed in" do
    it "requires the user to sign in or sign up" do
      visit root_path

      expect(page).to have_content "Sign In or Sign Up"
    end
  end

  context "when user is signed in" do
    it "does not require the user to sign in or sign up" do
      sign_in(user)

      expect(page).to_not have_content "Sign In or Sign Up"
    end
  end
end
