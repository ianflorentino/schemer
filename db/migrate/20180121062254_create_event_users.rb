class CreateEventUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :event_users do |t|
      t.integer :event_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
