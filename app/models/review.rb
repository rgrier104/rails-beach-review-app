class Review < ApplicationRecord
  belongs_to :user
  belongs_to :beach

  validates :overall_rating, presence: true
  validates :overall_description, presence: true
  validaes :overall_rating, :parking_rating, :surfing_rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  validates_associated :beach


  accepts_nested_attributes_for :beach
end
