class SessionsController < ApplicationController

  def new
  end

  def create
   teacher = Teacher.find_by(email: params[:session][:email].downcase)
   if teacher && teacher.authenticate(params[:session][:password])
     # Log the user in and redirect to the user's show page.
     sign_in teacher
     redirect_to teacher
     flash[:success] = "Welcome back to the CaffeineJag Esl App!"
   else
     # Create an error message.
     flash[:danger] = 'Invalid email/password combination'
     render 'new'
    end
  end

    def destroy
    sign_out
    redirect_to root_url
  end
end
