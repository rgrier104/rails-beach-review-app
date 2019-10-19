class Beach < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews

    validates :name, presence: true, uniqueness: true
    validates :city, presence: true
    validates :shore, presence: true
end
