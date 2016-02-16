class RequestsController < ApplicationController
  def new
    @request = Request.new
    @users = User.all
  end

  def show
  end
end
