class OtpMailer < ApplicationMailer
    def otp_email(email)
        @user = email
        mail(to: @user, subject: 'Your OTP for Two-Factor Authentication')
      end
end
