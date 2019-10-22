class Review < ApplicationRecord
  belongs_to :user
  belongs_to :beach

  validates :overall_rating, presence: true
  validates :overall_description, presence: true
  validates :overall_rating, inclusion: { in: 1..5, message: "must be between 1 and 5" }
  validates :parking_rating, inclusion: { in: 1..5, message: "must be between 1 and 5" }, unless: -> { parking_rating.blank? }
  validates :surfing_rating, inclusion: { in: 1..5, message: "must be between 1 and 5" }, unless: -> { surfing_rating.blank? }
  validates_associated :beach


  accepts_nested_attributes_for :beach, reject_if: proc { |attributes| attributes['name'].blank? }

  def self.average_rating
    average(:overall_rating)
  end
end
