class Bike < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :price, presence: true
  validates :price, numericality: true
  validates :size, presence: true
  validates :description, presence: true
  validates_length_of :name, maximum: 20
end