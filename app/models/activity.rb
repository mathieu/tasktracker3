class Activity < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  validates_presence_of :description
  validates_presence_of :project
  validates_presence_of :user
  validate :one_date_for_user

protected
  def one_date_for_user
    unless user.nil?
      user.activities.each do |a|
        if a.date.eql?(date) 
          errors.add(:one_date_for_user, 'you have already an activity recorded for this date')
          break
        end   
      end
    end
  end
  
end