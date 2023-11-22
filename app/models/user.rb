class User < ApplicationRecord
    before_create :generate_reset_token
    has_many :courses, dependent: :destroy
    has_secure_password

    enum role: { student: 0, instructor: 1 }

    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }
    validates :role, presence: true  

    private

    def generate_reset_token
        self.reset_token = SecureRandom.urlsafe_base64
    end
end
  