class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :message
      t.string :subject
      t.references :user, index: true
      t.references :trip, index: true

      t.timestamps
    end
  end
end
