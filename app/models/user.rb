class User < ApplicationRecord
    has_many :reviews
    has_many :beaches, through: :reviews
    has_secure_password
end
