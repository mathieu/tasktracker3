class Activity < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  validates_presence_of :description
  validates_presence_of :project
  validates_presence_of :user
  validates_numericality_of :day_percent, :only_integer => true, :less_than_or_equal_to => 100
  
end