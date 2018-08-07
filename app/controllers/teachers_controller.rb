class TeachersController < ApplicationController

  def show
    @teacher = Teacher.find(params[:id])
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)    # Not the final implementation!
    if @teacher.save
      flash[:success] = "Welcome to the CaffeineJag Esl App!"
      redirect_to @teacher
    else
    render 'new'
  end
 end

private

   def teacher_params
     params.require(:teacher).permit(:name, :email, :password,
                                  :password_confirmation)
   end
end
