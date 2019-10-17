class Review < ApplicationRecord
  belongs_to :user
  belongs_to :beach
  accepts_nested_attributes_for :beach
end
