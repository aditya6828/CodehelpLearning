class PasswordResetsController < ApplicationController
    def new
    end
  
    def create
      user = User.find_by(email: params[:email])
      if user
        # Generate secure token and send reset email here
        user.generate_reset_token
        user.save
        UserMailer.password_reset(user).deliver_now
        redirect_to root_path, notice: 'Password reset instructions sent to your email.'
      else
        flash.now[:alert] = 'Email not found.'
        render :new
      end
    end
  end
  