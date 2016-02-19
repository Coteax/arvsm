class Request < ActiveRecord::Base
  # Status and Absense Type Enums
  enum status: { requested: 'status_requested',
                 approved: 'status_approved',
                 denied: 'status_denied' }

  enum absense_type: { full: 'absense_full',
                       sickness: 'absense_sickness',
                       partial: 'absense_partial' }


  # Non persisted virtual atrributes for partial absense functionality
  attr_accessor  :time_starting, :time_ending

  # Setup relations
  belongs_to :user
  belongs_to :user_assigned, class_name: 'User'

  # Model Validations
  validates :user_id, :user_assigned,
            :absense_type, :description,
            presence: true

  validates :description, length: { minimum: 20 }

  # Validate these attributes only for non partial absense types
  with_options unless: :is_partial? do |np|
    # Absense starting date should be after tommorow
    np.validates_date :starting, :on => :create, :on_or_after => :today
    # Absense ending date should be after starting
    np.validates_date :ending, :on => :create, :after => :starting

    np.validates      :days_off,
                       numericality: { only_integer: true,
                                       greater_than_or_equal_to: 1 }

  end
  # Validate these fields only for partial absense type
  with_options if: :is_partial?,on: :create do |p|
    p.validates_date :partial_starting, :on_or_after => :today
    p.validates_time :time_starting
    p.validates_time :time_ending, :after => :time_starting

  end
  # Initialize to Request status
  after_initialize :set_default_values

  # Set default absense_type
  def set_default_values
    self.absense_type ||= Request.absense_types[:full]
  end

  def partial_starting
    @partial_starting
  end
  def partial_starting=(val)
    @partial_starting=val
  end
  def is_partial?
    partial?
  end

end
