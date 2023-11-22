class UserMailer < ApplicationMailer
    default from: 'harshdh55@gmail.com'

    def otp_email(email,otp)
      puts "this is the mailer method"
      @email = email
      puts "email = #{email}"
      @otp = otp
      puts "otp = #{@otp}"
      mail(to: email, subject: 'Your OTP for Two-Factor Authentication')
    end
end
