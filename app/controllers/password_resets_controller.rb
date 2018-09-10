class PasswordResetsController < ApplicationController
  before_action :get_teacher,   only: [:edit, :update]
  before_action :valid_teacher, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
  end

  def create
    @teacher = Teacher.find_by(email: params[:password_reset][:email].downcase)
    if @teacher
      @teacher.create_reset_digest
      @teacher.send_password_reset_email
      flash[:info] = "Email sent with password reset instructions"
      redirect_to root_url
    else
      flash.now[:danger] = "Email address not found"
      render 'new'
    end
  end

  def edit
  end

  def update
  if params[:teacher][:password].empty?
    @teacher.errors.add(:password, "can't be empty")
    render 'edit'
  elsif @teacher.update_attributes(teacher_params)
    @teacher.update_attribute(:reset_digest, nil)
    flash[:success] = "Password has been reset."
    redirect_to @teacher
  else
    render 'edit'
  end
end

  private

  def teacher_params
      params.require(:teacher).permit(:password, :password_confirmation)
  end

  def get_teacher
    @teacher = Teacher.find_by(email: params[:email])
  end


  def valid_teacher
    unless (@teacher&& @teacher.activated? &&
            @teacher.authenticated?(:reset, params[:id]))
      redirect_to root_url
    end
  end

   def check_expiration
     if @teacher.password_reset_expired?
       flash[:danger] = "Password reset has expired."
       redirect_to new_password_reset_url
     end
   end

end
