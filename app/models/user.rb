class User < ActiveRecord::Base
  has_many :microposts
  has_secure_password
end
