class AddPoolReferencesToUser < ActiveRecord::Migration
  def change
    add_reference :users, :pool, index: true
  end
end
