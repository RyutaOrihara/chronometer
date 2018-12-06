class AddConfirmableToDevice < ActiveRecord::Migration[5.1]
  def up
    add_index :users, :confirmation_token, unique: true
    execute("UPDATE users SET confirmed_at = NOW()")
  end

  def down
    remove_columns :users, :confirmation_token, :confirmed_at, :confirmation_sent_at
    remove_columns :users, :unconfirmed_email # Only if using reconfirmable
  end
end
