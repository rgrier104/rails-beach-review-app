class Review < ApplicationRecord
  belongs_to :user
  belongs_to :beach
  has_one_attached :image

  validates :overall_rating, presence: true
  validates :overall_description, presence: true
  validates :overall_rating, inclusion: { in: 1..5, message: "must be between 1 and 5" }
  validates :parking_rating, inclusion: { in: 1..5, message: "must be between 1 and 5" }, unless: -> { parking_rating.blank? }
  validates :surfing_rating, inclusion: { in: 1..5, message: "must be between 1 and 5" }, unless: -> { surfing_rating.blank? }
  validates :beach, uniqueness: { scope: :user, message: "has already been reviewed by you"}, on: :create
  validates_associated :beach


  accepts_nested_attributes_for :beach, reject_if: proc { |attributes| attributes['name'].blank? }

  scope :order_by_rating, -> {order(overall_rating: :desc)}
  scope :order_by_date, -> {order(updated_at: :desc)}

  def self.average_rating
    average(:overall_rating)
  end

  def date_updated
    self.updated_at.strftime("%m/%d/%y")
  end
end
