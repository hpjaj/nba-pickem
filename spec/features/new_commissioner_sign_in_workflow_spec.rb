require 'rails_helper'

describe "New commissioner signing up" do

  include Warden::Test::Helpers
  Warden.test_mode!

  let(:user) { create :user }

  before do
    sign_in(user)
  end

  it "offers commissioner to create a new pool" do
    expect(page).to have_content "Create a new pool"
  end

  it "clicking link allows commissioner to pick a pool name" do
    click_link "Create a new pool"

    expect(page).to have_content "Pool name"
  end

  it "creates a new pool" do
    expect(Pool.count).to eq 0

    click_link "Create a new pool"
    fill_in 'Pool name', with: 'hpjaj'
    click_button 'Create Pool'

    expect(Pool.count).to eq 1
  end

  it "redirects commissioner to their pool's home page upon successful pool creation" do
    click_link "Create a new pool"
    fill_in 'Pool name', with: 'hpjaj'
    click_button 'Create Pool'

    expect(current_path).to eq pool_path(Pool.first)
  end

end
