class Micropost < ApplicationRecord
  belongs_to :user
  has_many :likes ,dependent: :destroy
  has_many :users, through: :likes
  default_scope -> { order(created_at: :desc)}
  mount_uploader :picture,PictureUploader
  validates :user_id, presence:true
  validates :content, presence:true,length:{ maximum: 140 }
  validate :picture_size

  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "shuold be less than 5MB")
    end
  end

  def self.searching(word)
    if word
      Micropost.where('content LIKE ?', "%#{word}%")
    end
  end

  def self.replying(id)
    Micropost.where("reply_to = ?", id).order(created_at: :asc)
  end
end
