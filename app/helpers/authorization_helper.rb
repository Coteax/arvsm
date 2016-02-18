module AuthorizationHelper
  # Authorization Helper to redirect non authenticated users to login page
  def logged_in_user
    unless logged_in?
      redirect_to login_url
    end
  end
end
