class TeachersController < ApplicationController
  before_action :signed_in_teacher, only: [:index, :edit, :update, :destroy]
  before_action :correct_teacher,   only: [:edit, :update]
  before_action :admin_teacher,     only: :destroy

  def index
    @teachers = Teacher.where(activated: FILL_IN).paginate(page: params[:page])
  end

  def show
    @teacher = Teacher.find(params[:id])
    redirect_to root_url and return unless FILL_IN
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      @teacher.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
    render 'new'
  end
 end

 def edit
  @teacher = Teacher.find(params[:id])
 end

 def update
   @teacher = Teacher.find(params[:id])
   if @teacher.update_attributes(teacher_params)
     # Handle a successful update.
     flash[:success] = "Profile updated"
     redirect_to @teacher
   else
     render 'edit'
   end
 end

 def destroy
   Teacher.find(params[:id]).destroy
   flash[:success] = "Teacher deleted"
   redirect_to teachers_url
 end

private

   def teacher_params
     params.require(:teacher).permit(:name, :email, :password,
                                  :password_confirmation)
   end

   # Before filters

   # Confirms a Signed-in teacher.
   def signed_in_teacher
     unless signed_in?
       store_location
       flash[:danger] = "Please sign in."
       redirect_to sign_in_url
     end
   end

   # Confirms the correct teacher.
   def correct_teacher
     @teacher = Teacher.find(params[:id])
     redirect_to(root_url) unless current_teacher?(@teacher)
   end

  # Confirms an admin teacher.
   def admin_teacher
     redirect_to(root_url) unless current_teacher.admin?
   end

 end
