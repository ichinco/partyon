class AddStatusToInvitation < ActiveRecord::Migration
  def change
    add_column :invitations, :status, :boolean
  end
end
