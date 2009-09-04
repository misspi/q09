class Question < ActiveRecord::Base
  has_many :answers, :include => [:user]
end
