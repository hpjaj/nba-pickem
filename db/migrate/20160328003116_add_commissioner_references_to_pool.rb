class AddCommissionerReferencesToPool < ActiveRecord::Migration
  def change
    add_reference :pools, :commissioner, index: true
  end
end
