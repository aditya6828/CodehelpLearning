class User < ApplicationRecord
    before_create :generate_reset_token
    has_secure_password

    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }

    private

    def generate_reset_token
        self.reset_token = SecureRandom.urlsafe_base64
    end
end
  