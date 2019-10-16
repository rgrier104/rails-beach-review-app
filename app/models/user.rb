class User < ApplicationRecord
    has_many :reviews
    has_many :beaches, through: :reviews
end
