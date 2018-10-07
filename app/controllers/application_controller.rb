class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper


private

  def signed_in_teacher
    unless signed_in?
      store_location
      flash[:danger] = "Please sign in."
      redirect_to sign_in_url
    end
  end

end
