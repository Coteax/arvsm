class RequestsController < ApplicationController
  def new
    @request = Request.new
    @users = User.all
  end

  def create

  end

  def show
  end

 def index
 end

end
