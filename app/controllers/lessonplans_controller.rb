class LessonplansController < ApplicationController
  before_action :signed_in_teacher, only: [:index, :new, :create, :destroy]
  before_action :correct_teacher,   only: :destroy

  def index
    @lessonplans = Lessonplan.all
  end

  def new
    @lessonplan = Lessonplan.new
  end

  def create
    @lessonplan = current_teacher.lessonplans.new(lessonplan_params)
    if @lessonplan.save
      flash[:success] = "Lessonplan created!"
        redirect_to root_url
   else
      @feed_items = []
      render "static_pages/home"
   end
  end

  def destroy
  @lessonplan.destroy
  flash[:success] = "Lessonplan deleted"
  redirect_to request.referrer || root_url
end

  private
     def lessonplan_params
     params.require(:lessonplan).permit(:name, :attachment)
  end

  def correct_teacher
     @lessonplan = current_teacher.lessonplans.find_by(id: params[:id])
     redirect_to root_url if @lessonplan.nil?
  end

end
