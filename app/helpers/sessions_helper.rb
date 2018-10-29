module SessionsHelper

 # signs in the given teacher.
 def sign_in(teacher)
   session[:teacher_id] = teacher.id
 end

 # Remembers a teacher in a persistent session.
 def remember(teacher)
   teacher.remember
   cookies.permanent.signed[:teacher_id] = teacher.id
   cookies.permanent[:remember_token] = teacher.remember_token
 end

 # Returns true if the given user is the current user.
  def current_teacher?(teacher)
    teacher == current_teacher
  end

 # Returns the teacher corresponding to the remember token cookie.
 def current_teacher
   if (teacher_id = session[:teacher_id])
     @current_teacher ||= Teacher.find_by(id: teacher_id)
   elsif (teacher_id = cookies.signed[:teacher_id])
     teacher = Teacher.find_by(id: teacher_id)
     if teacher && teacher.authenticated?(:remember, cookies[:remember_token])
       sign_in teacher
       @current_teacher = teacher
    end
  end
end

 # Returns true if the teacher is signed in, false otherwise.
  def signed_in?
    !current_teacher.nil?
  end

  # Forgets a persistent session.
  def forget(teacher)
    teacher.forget
    cookies.delete(:teacher_id)
    cookies.delete(:remember_token)
  end

  # Logs out the current teacher.
  def sign_out
    forget(current_teacher)
    session.delete(:teacher_id)
    @current_teacher = nil
  end

  # Redirects to stored location (or to the default).
 def redirect_back_or(default)
   redirect_to(session[:forwarding_url] || default)
   session.delete(:forwarding_url)
 end

 # Stores the URL trying to be accessed.
 def store_location
   session[:forwarding_url] = request.original_url if request.get?
 end
end
