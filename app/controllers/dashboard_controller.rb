class DashboardController < ApplicationController
  def index
    if current_user.is_manager?
      @requests = current_user.assigned_requests.order(created_at: :desc)
      render 'index_manager'
    else
      @requests = current_user.requests.order(updated_at: :desc)
    end

  end
end
