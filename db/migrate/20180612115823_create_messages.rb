class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :send_user_id
      t.string :content

      t.timestamps
    end
    add_index :messages, :user_id
    add_index :messages, :send_user_id
    add_index :messages, %i[user_id send_user_id]
  end
end
