class SessionsController < ApplicationController

  def new
  end

  def create
   teacher = Teacher.find_by(email: params[:session][:email].downcase)
   if teacher && teacher.authenticate(params[:session][:password])
     # Log the user in and redirect to the user's show page.
     sign_in teacher
     params[:session][:remember_me] == '1' ? remember(teacher) : forget(teacher)
     redirect_back_or teacher
     flash[:success] = "Welcome back to the CaffeineJag Esl App!"
   else
     # Create an error message.
     flash[:danger] = 'Invalid email/password combination'
     render 'new'
    end
  end

    def destroy
    sign_out if signed_in?
    redirect_to root_url
  end
end


# class SessionsController < ApplicationController
#
#   def new
#   end
#
#   def create
#    teacher = Teacher.find_by(email: params[:session][:email].downcase)
#    if teacher && teacher.authenticate(params[:session][:password])
#      # Log the user in and redirect to the user's show page.
#      sign_in teacher
#      remember teacher
#      redirect_to teacher
#      flash[:success] = "Welcome back to the CaffeineJag Esl App!"
#      redirect_back_or teacher
#    else
#      # Create an error message.
#      flash[:danger] = 'Invalid email/password combination'
#      render 'new'
#     end
#   end
#
#     def destroy
#     sign_out if signed_in?
#     redirect_to root_url
#   end
# end
