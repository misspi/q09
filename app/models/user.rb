class User < ActiveRecord::Base
  has_many :answers, :include => [:question]
  acts_as_authentic
  attr_accessible :username, :email, :password, :password_confirmation, :request_info
end
