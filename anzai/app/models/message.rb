# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :user
  belongs_to :send_user, class_name: 'User'

  def self.dm(id1, id2)
    Message.where('send_user_id = ? AND user_id = ?', id1, id2)
           .or(Message.where('send_user_id = ? AND user_id =?', id2, id1))
    end
end
