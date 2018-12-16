class CreateParticipations < ActiveRecord::Migration[5.1]
  def change
    create_table :participations do |t|
      t.integer :user_id
      t.integer :event_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
