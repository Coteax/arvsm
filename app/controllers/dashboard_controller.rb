class DashboardController < ApplicationController
  before_action :logged_in_user
  before_action :user_is_manager, only: [:incoming]
  def index
    @requests = current_user.requests.order(updated_at: :desc)
  end

  def incoming
    @requests = current_user.assigned_requests.order(created_at: :desc)
  end

  def user_is_manager
    redirect_to(root_url) unless current_user.is_manager?
  end
end
