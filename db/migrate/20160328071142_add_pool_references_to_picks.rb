class AddPoolReferencesToPicks < ActiveRecord::Migration
  def change
    add_reference :picks, :pool, index: true
  end
end
