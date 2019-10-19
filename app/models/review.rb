class Review < ApplicationRecord
  belongs_to :user
  belongs_to :beach

  validates :overall_rating, presence: true
  validates :overall_description, presence: true
  validates_associated :beach


  accepts_nested_attributes_for :beach
end
