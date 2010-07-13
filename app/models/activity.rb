class Activity < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  validates_presence_of :description
  validates_presence_of :project
  validates_presence_of :user
  validate :one_date_for_user

protected
  def one_date_for_user
    if !user.nil? and user.activities.size > 0
      puts "Activities size = #{user.activities.size}"
      errors.add(:date, 'you have already an activity recorded for this date') if user.activities.include?(:date)
    end
  end
end
