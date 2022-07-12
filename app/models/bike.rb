class Bike < ApplicationRecord
  scope :three_most_recent, -> { order(created_at: :desc).limit(3)}

  has_one_attached :bike_photo
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :price, presence: true
  validates :price, numericality: true
  validates :size, presence: true
  validates :description, presence: true
  validates_length_of :name, maximum: 20
end