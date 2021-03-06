class Room < ApplicationRecord
    belongs_to :user
    has_many :reservations

    validates :room_name, presence: true
    validates :description, presence: true
    validates :price, numericality: true
    validates :address, presence: true
    validates :image, presence: true

    mount_uploader :image, ImageUploader
end
