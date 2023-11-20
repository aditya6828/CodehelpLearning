class SessionsController < ApplicationController

    def new
      
    end
    def create
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        # Generate and send OTP via email
        otp = rand(1000..9999)
        user[:otp] = otp
        # user.update(otp: otp)
        # UserMailer.otp_email(user).deliver_now
        OtpMailer.send_otp(user).deliver_now
        redirect_to verify_otp_sessions_path(user_id: user.id)
        # render :verify_otp, locals: { user: user }
      else
        flash.now[:alert] = 'Invalid email or password.'
        render :new
      end
    end
  
    def verify_otp
      user = User.find_by(id: params[:id])
      if user && user.otp == params[:otp].to_i
        # OTP verification successful, generate JWT token and log in
        jwt_token = JsonWebToken.encode(user_id: user.id)
        cookies.signed[:jwt] = { value: jwt_token, httponly: true, expires: 1.hour.from_now }
        redirect_to root_path, notice: 'Logged in successfully.'
      else
        flash.now[:alert] = 'Invalid OTP.'
        render :verify_otp, locals: { user: user }
      end
    end
  end
