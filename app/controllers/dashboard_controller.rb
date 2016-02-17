class DashboardController < ApplicationController
  def index
    @requests = current_user.requests.order(updated_at: :desc)
  end
end
