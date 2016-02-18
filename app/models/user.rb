class User < ActiveRecord::Base
  has_many :requests
  has_many :assigned_requests,class_name: "Request",foreign_key: 'user_assigned_id'
  # password encryption and confirmation
  has_secure_password
end
