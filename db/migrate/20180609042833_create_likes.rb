# frozen_string_literal: true

class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.references :user, null: false
      t.references :micropost, null: false

      t.timestamps
    end
    add_index :likes, %i[user_id micropost_id], unique: true
  end
end
