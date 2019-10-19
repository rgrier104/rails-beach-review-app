class Beach < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews

    validates :name, presence: true, uniqueness: true
    validates :city, presence: true
    validates :shore, presence: true, inclusion: { in: %w{North East South West}, message: "must be either North, South, East, or West."}
end
