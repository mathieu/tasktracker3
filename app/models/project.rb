class Project < ActiveRecord::Base
  has_many :activities
  
  
  def has_activity_for_user_and_date(user, a_date)
    self.activities.each do |a|  
      if a.date.eql?(a_date) and a.user == user 
        return true
      end
    end
    return false
  end
  
end
