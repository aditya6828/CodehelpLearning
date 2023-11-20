class UsersController < ApplicationController
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      email = @user.email
      if @user.save
        # Send verification email here
       ::UserMailer.otp_email(email).deliver_now
        redirect_to root_path, notice: 'Registration successful. Please check your email for verification.'
      else
        render :new
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
  