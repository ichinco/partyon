class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.references :trip, index: true
      t.string :code
      t.string :email
      t.string :name
      t.string :role

      t.timestamps
    end
  end
end
