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

  def self.searching(search)
    if search
      Micropost.where(['content LIKE ?', "%#{search}%"])
    end
  end
end
