class AddDescriptionToCost < ActiveRecord::Migration
  def change
    add_column :costs, :description, :string
  end
end
