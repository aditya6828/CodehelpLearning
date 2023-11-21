class CoursesController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]

    def index
        @courses = Course.all
    end

    def new
        @course = Course.new
    end

    def create
        @course = current_user.courses.build(course_params)
        if @course.save
            redirect_to courses_path, notice: 'Courses created successfully.'
        else 
            render :new
        end
    end

    private

    def course_params
        params.require(:course).permit(:title, :description, :price, :video, :documentation)
    end
end
