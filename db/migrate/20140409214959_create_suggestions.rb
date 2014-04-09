class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.references :user, index: true
      t.text :message

      t.timestamps
    end
  end
end
