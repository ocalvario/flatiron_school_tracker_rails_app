#join table
class Lab < ActiveRecord::Base
  belongs_to :topic
  belongs_to :lab
end
