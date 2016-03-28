require 'rails_helper'

RSpec.describe PoolsController, :type => :controller do

  let(:user) { create :user }

  before do
    sign_in :user, user
  end

  context "POST create" do
    before do
      params = { pool: { name: 'hpjaj' } }
      post :create, params
      user.reload
    end

    it "the new pool and the current user are correctly associated" do
      expect(user.pools).to eq [Pool.first]
      expect(Pool.first.users).to eq [user]
    end

    it "makes the user the pool's commissioner" do
      expect(Pool.first.commissioner).to eq user.commissioners.first
    end
  end
end
