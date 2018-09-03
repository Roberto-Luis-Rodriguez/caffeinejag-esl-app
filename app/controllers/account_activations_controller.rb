class AccountActivationsController < ApplicationController
   def edit
    teacher = Teacher.find_by(email: params[:email])
    if teacher && !teacher.activated? && teacher.authenticated?(:activation, params[:id])
      teacher.activate
      sign_in teacher
      flash[:success] = "Account activated!"
      redirect_to teacher
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end
end
