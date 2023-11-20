# Preview all emails at http://localhost:3000/rails/mailers/otp_mailer
class OtpMailerPreview < ActionMailer::Preview

    def otp_email
        user = User.new(email: 'adityaanand6828@gmail.com') # Replace with a valid email for testing
        OtpMailer.otp_email(user)
    end

end
