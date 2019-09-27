class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.references :actionable, polymorphic: true
      t.integer :user_id

      t.timestamps
    end
  end
end
