class SessionsController < ApplicationController

  def new
  end

  def create
   teacher = Teacher.find_by(email: params[:session][:email].downcase)
   if teacher && teacher.authenticate(params[:session][:password])
     if teacher.activated?
          sign_in teacher
          params[:session][:remember_me] == '1' ? remember(teacher) : forget(teacher)
          redirect_back_or teacher
          flash[:success] = "Welcome back to the CaffeineJag Esl App!"
      else
          message  = "Account not activated. "
          message += "Check your email for the activation link."
          flash[:warning] = message
          redirect_to root_url
      end
   else
     flash[:danger] = 'Invalid email/password combination'
     render 'new'
    end
  end

    def destroy
    sign_out if signed_in?
    redirect_to root_url
  end
end
