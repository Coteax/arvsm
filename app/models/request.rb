class Request < ActiveRecord::Base
  belongs_to :user
  belongs_to :user_assigned, class_name: 'User'
  validates :user_id,:user_assigned, presence: true
  validates :absense_type, presence: true
  validates :description, presence: true, length: { minimum: 20 }

  enum status: { requested: 'status_requested',
                 approved: 'status_approved',
                 denied: 'status_denied' }

  enum absense_type: { full: 'absense_full',
                       sickness: 'absense_sickness',
                       partial: 'absense_partial' }

  after_initialize :set_default_values

  attr_accessor :partial_starting, :time_starting, :time_ending
  def set_default_values
    # Set default absense_type
    self.absense_type ||= Request.absense_types[:full]
  end
end
