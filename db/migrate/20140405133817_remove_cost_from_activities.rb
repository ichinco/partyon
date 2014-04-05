class RemoveCostFromActivities < ActiveRecord::Migration
  def change
    remove_column :activities, :cost
  end
end
