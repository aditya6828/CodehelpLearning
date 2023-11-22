class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:courses, :create_course]

  def new
    @user = User.new
  end

  def courses
    @courses = current_user.courses
  end

  
  def create
    @user = User.new(user_params)
    session[:user] = @user
    @email = @user.email
    mailOTP = rand(1000..9999)
    session[:otp] = mailOTP
    

    ::UserMailer.otp_email(@email, mailOTP).deliver_now
    if @user.valid?
      redirect_to confirmEmail_path
    end
    # if @user.save
      
    #   redirect_to root_path, notice: 'Registration successful. Please check your email for verification.'
    # else  
    #   render :new
    # end
  end

  

  # def confirmEmail

  # end

  def create_course
    @course = current_user.courses.built(course_params)

    if @course.save
      redirect_to courses_user_path(current_user), notice: 'Course created successfully.'
    else
      render :courses
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role)
  end

  def course_params
    params.require(:course).permit(:title, :description, :price, :video, :document)
  end
    
end
  