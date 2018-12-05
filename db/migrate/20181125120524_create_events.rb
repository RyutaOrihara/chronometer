class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :time
      t.text :place
      t.integer :capacity
      t.text :content
      t.string :image
      t.bigint :user_id
    end
  end
end
