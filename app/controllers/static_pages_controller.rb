class StaticPagesController < ApplicationController
  def home
    if signed_in?
    @lessonplan = current_teacher.lessonplans.build
    @feed_items = current_teacher.feed.paginate(page: params[:page])
   end
 end
end
