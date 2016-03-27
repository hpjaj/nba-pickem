require 'rails_helper'

RSpec.describe PoolsController, :type => :controller do

  let(:user) { create :user }

  before do
    sign_in :user, user
  end

  context "POST create" do
    it "the new pool and the current user are correctly associated" do
      expect(user.pool_id).to eq nil

      params = { pool: { name: 'hpjaj' } }
      post :create, params
      user.reload

      expect(user.pool).to eq Pool.first
      expect(Pool.first.users).to eq [user]
    end
  end
end
