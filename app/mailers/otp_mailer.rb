class OtpMailer < ApplicationMailer
  def send_otp(user)
    @user = user
    mail(to: @user.email, subject: 'Your OTP for Two-Factor Authentication')
  end
end
