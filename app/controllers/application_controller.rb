class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # Require that a unique authenticity token be submitted with each form.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

 # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !!current_user
  end

  def authorized_to_edit?
    if !logged_in?
     flash[:danger] = "Not authorized! Please sign up or login."
     redirect_to login_path
    end
  end


  private

  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= Student.find(session[:student_id]) if session[:student_id]  #@current_user is equal to the instance
  end


end
