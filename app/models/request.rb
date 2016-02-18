class Request < ActiveRecord::Base
  # Status and Absense Type Enums
  enum status: { requested: 'status_requested',
                 approved: 'status_approved',
                 denied: 'status_denied' }

  enum absense_type: { full: 'absense_full',
                       sickness: 'absense_sickness',
                       partial: 'absense_partial' }

  # Non persisted virtual atrributes for partial absense functionality
  attr_accessor :partial_starting, :time_starting, :time_ending

  # Setup relations
  belongs_to :user
  belongs_to :user_assigned, class_name: 'User'

  # Model Validations
  validates :user_id, :user_assigned,
            :absense_type, :description,
            presence: true

  validates :description, length: { minimum: 20 }

  # Validate these attributes only for non partial absense types
  validates :starting, :ending,
            :days_off, presence: true,
                       unless: :is_partial?
  validates :days_off,
            numericality: { only_integer: true,
                            greater_than_or_equal_to: 1 },
            unless: :is_partial?

  # Validate these fields only for partial absense type
  validates :partial_starting, :time_starting,
            :time_ending, presence: true,
                          if: :is_partial_and_new

  # Initialize to Request status
  after_initialize :set_default_values

  # Set default absense_type
  def set_default_values
    self.absense_type ||= Request.absense_types[:full]
  end

  def is_partial_and_new
    partial? && new_record?
  end

  def is_partial?
    partial?
  end
end
