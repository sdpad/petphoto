class Post < ApplicationRecord
  belongs_to :user
  
  validates :content,presence: true,length: {maximum: 255}
  validates :img,presence: true
  
  mount_uploader :img,ImgUploader
end
