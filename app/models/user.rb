class User < ApplicationRecord
    has_many :reviews
    has_many :beaches, through: :reviews
    has_secure_password

    def self.from_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |user|
            user.firstname = auth.info.first_name
            user.lastname = auth.info.last_name
            user.email = auth.info.email
            user.password = SecureRandom.hex
        end
    end
end
