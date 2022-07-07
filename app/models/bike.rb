class Bike < ApplicationRecord
  has_many :reviews, dependent: :destroy
end