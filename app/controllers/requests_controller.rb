class RequestsController < ApplicationController
  def new
    @request = Request.new
  end

  def create
    @request = Request.new(create_params)

    # Set non user supplied data user and status
    @request.user = current_user
    @request.status = Request.statuses[:requested]
    if @request.partial?
      @request.starting = Time.parse(@request.time_starting)
      @request.ending = Time.parse(@request.time_ending)
    end

    if @request.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @request = Request.find(params[:id])
  end

  def index
  end

  def update
    @request = Request.find(params[:id])

    if params['approve']
      @request.status = Request.statuses[:approved]
    elsif params['deny']
      @request.status = Request.statuses[:denied]
    end

    if @request.update_attributes(update_params)
      redirect_to root_path
    else          
      render 'show'
    end
  end

  private

  def create_params
    params.require(:request).permit(:description, :absense_type,
                                    :user_assigned_id, :partial_starting,
                                    :starting, :ending, :days_off,
                                    :time_starting, :time_ending)
  end

  def update_params
    params.require(:request).permit(:response)
  end
end
