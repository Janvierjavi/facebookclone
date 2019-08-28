class Facepost < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :user
    #many to many association
    has_many :favorites, dependent: :destroy
has_many :favorite_users, through: :favorites, source: :user
validates :content, presence: true
validates :content,    length: { maximum: 75 }  
end
