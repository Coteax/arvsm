class Request < ActiveRecord::Base
  # Non persisting helper atrributes
  attr_accessor :partial_starting, :time_starting, :time_ending

  belongs_to :user
  belongs_to :user_assigned, class_name: 'User'
  # Validations
  validates :user_id, :user_assigned, :absense_type, :description,
            presence: true

  validates :starting, :ending, :days_off, presence: true ,unless: :is_partial?
  validates :partial_starting, :time_starting,
            :time_ending, presence: true ,if: :is_partial?

  validates :days_off, numericality: { only_integer: true,
                                       greater_than_or_equal_to: 1 },
                                       unless: :is_partial?

  validates :description, length: { minimum: 20 }

  enum status: { requested: 'status_requested',
                 approved: 'status_approved',
                 denied: 'status_denied' }

  enum absense_type: { full: 'absense_full',
                       sickness: 'absense_sickness',
                       partial: 'absense_partial' }

  after_initialize :set_default_values

  def set_default_values
    # Set default absense_type
    self.absense_type ||= Request.absense_types[:full]
  end

  def is_partial?
    self.partial?
  end
end
