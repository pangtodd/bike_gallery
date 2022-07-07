class Review < ApplicationRecord
  belongs_to :bike
  validates :author, presence: true
  validates :content, presence: true
  validates :rating, presence: true
  validates :rating, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 5,  only_integer: true }
  validates_length_of :content, minimum: 5
  validates_length_of :content, maximum: 250
end