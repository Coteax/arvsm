class Request < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :description, presence: true, length: { maximum: 140 }
end
