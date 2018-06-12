class Message < ApplicationRecord
  belongs_to :user, class_name:"User"
  belongs_to :send_user, class_name:"User"

end
