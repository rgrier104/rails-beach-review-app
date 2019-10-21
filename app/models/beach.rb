class Beach < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews

    validates :name, :city, :shore, presence: true
    validates :name, uniqueness: true
    validates :shore, inclusion: { in: %w{North East South West}, message: "must be either North, South, East, or West."}
end
