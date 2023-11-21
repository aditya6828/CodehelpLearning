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
      email = @user.email
      if @user.save
        # Send verification email here
       ::UserMailer.otp_email(email).deliver_now
        redirect_to root_path, notice: 'Registration successful. Please check your email for verification.'
      else
        render :new
      end
    end

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
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

    def course_params
      params.require(:course).permit(:title, :description, :price, :video, :document)
    end
    
end
  