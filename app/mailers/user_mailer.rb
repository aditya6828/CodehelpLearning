class UserMailer < ApplicationMailer
    default_url_options[:host] = 'adityaanand6828@gmai.com'

    def otp_email(email)
      @user = email
      mail(to: @user, subject: 'Your OTP for Two-Factor Authentication')
    end
end
