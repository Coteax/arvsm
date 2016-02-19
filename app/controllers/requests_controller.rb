class RequestsController < ApplicationController
  # Confirm user is authenticated
  before_action :logged_in_user
  # Confirm user is authorized as manager to process requests
  before_action :user_is_assigned_to_request, only: [:show, :update]

  # New Absense Request action
  def new
    @request = Request.new
  end

  def create
    @request = Request.new(create_params)
    # Set request's user to current user
    @request.user = current_user
    # Set request status to Requested
    @request.status = Request.statuses[:requested]

    if @request.partial?

      begin
      # Combine Date and starting time
      time = Time.parse(@request.time_starting)
      @request.starting = Time.parse(@request.partial_starting)
                                  .change(hour: time.hour,
                                          minute: time.min)

      # Combine Date and ending time
      time = Time.parse(@request.time_ending)
      @request.ending = @request.starting
                                .change(hour: time.hour,
                                        minute: time.min)
      rescue

      end
    end


    if @request.save

      # Send email to assigned manager
      Mailer.notify_incoming_request(@request).deliver_later
      flash[:success] = 'Your absense request has been submitted successfully!'
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @request = Request.find(params[:id])
  end

  def update
    @request = Request.find(params[:id])
    # Change request status based on approval or denial
    if params['approve']
      @request.status = Request.statuses[:approved]
    elsif params['deny']
      @request.status = Request.statuses[:denied]
    end

    if @request.update_attributes(update_params)
      # Send email to requester about the status change
      Mailer.notify_changed_request_status(@request).deliver_later
      redirect_to incoming_path
    else
      render 'show'
    end
  end

  private

  # Allowed parameters for request creation
  def create_params
    params.require(:request).permit(:description, :absense_type,
                                    :user_assigned_id, :partial_starting,
                                    :starting, :ending, :days_off,
                                    :time_starting, :time_ending)
  end

  # Allowed parameters for request update
  def update_params
    params.require(:request).permit(:response)
  end

  # Managers should view only their assigned requests
  def user_is_assigned_to_request
    request = Request.find(params[:id])
    redirect_to(root_url) unless request.user_assigned == current_user
  end
end
