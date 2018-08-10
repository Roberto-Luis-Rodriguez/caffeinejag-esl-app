module SessionsHelper

  # signs in the given teacher.
 def sign_in(teacher)
   session[:teacher_id] = teacher.id
 end

 # Returns the current signed in teacher (if any).
 def current_teacher
   @current_teacher ||= Teacher.find_by(id: session[:teacher_id])
 end

 # Returns true if the teacher is signed in, false otherwise.
  def signed_in?
    !current_teacher.nil?
  end

  # Logs out the current user.
  def sign_out
    session.delete(:teacher_id)
    @current_teacher = nil
  end
end
