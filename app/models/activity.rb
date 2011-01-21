class Activity < ActiveRecord::Base
  
  belongs_to :project
  belongs_to :user
  validates_presence_of :description
  validates_presence_of :project
  validates_presence_of :user
  
  validates_numericality_of :hours_worked, :only_integer => true, :message => "can only be plain hour."
  validates_inclusion_of :hours_worked, :in => 1..8, :message => "can only be between 1 and 8."
  
end