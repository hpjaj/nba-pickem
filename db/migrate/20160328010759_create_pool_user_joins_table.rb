class CreatePoolUserJoinsTable < ActiveRecord::Migration
  def change
    create_table :pools_users, id: false do |t|
      t.belongs_to :pool, index: true
      t.belongs_to :user, index: true
    end
  end
end
