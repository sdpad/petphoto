class Post < ApplicationRecord
  belongs_to :user
  
  validates :content,presence: true,length: {maximum: 255}
  validates :img,presence: true
  
  mount_uploader :img,ImgUploader
  
  has_many :favorites,dependent: :destroy
  has_many :liked,through: :favorites,source: :user
  
  has_many :comments,dependent: :destroy
end
