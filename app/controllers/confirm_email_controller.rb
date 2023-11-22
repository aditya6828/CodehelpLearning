class ConfirmEmailController < ApplicationController
  def verify_otp
    # @user = User.find_by(id: params[:id])
    puts "heelooo inside confirm_email to verify otp "
    # puts "user = #{@user}"
    stored_otp = session[:otp]
    # existing_user = User.find_by(email: user_attributes['email'])
    # Check if user exists and OTP is correct
    if stored_otp == params[:otp].to_i
      # OTP verification successful, update user's email status or perform other actions
      # @user.update(email_confirmed: true)
      
      puts " stored otp is equal to parameter otp"
      user_attribute = session[:user]
      user = User.new(user_attribute)

      if user.save
        session[:user] = nil
        session[:otp] = nil

        redirect_to root_path, notice: 'Email verified successfully.'
      else
        puts "Validation errors: #{user.errors.full_messages.join(', ')}"
        flash.now[:alert] = 'User creation failed.'
        render :verify_otp
      end
      # puts " user = #{user}"
      # user.save
      # puts "user is saved #{user.email}"
      # redirect_to root_path, notice: 'Email verified successfully.'
    else
      puts "I am inside else part of otp validation"
      flash.now[:alert] = 'Invalid OTP.'
      render :verify_otp
    end
  end
end
      