class DashboardController < ApplicationController
  before_action :logged_in_user
  before_action :user_is_manager, only: [:incoming]
  def index
    if current_user.is_manager?
      @requests = current_user.assigned_requests.order(created_at: :desc)
      render 'index_manager'
    else
      @requests = current_user.requests.order(updated_at: :desc)
    end
  end

  def incoming
  end

  def user_is_manager
    redirect_to(root_url) unless current_user.is_manager?
  end
end
