class Project < ActiveRecord::Base
  has_many :activities
  
  
  def leaving_percent_by_user_and_activity(user, activity_date)
    sum_percent = 0 
    
    puts "activity nb #{self.activities.count}"
    
    self.activities.each do |a|  
      if a.date.eql?(activity_date) and a.user == user 
        sum_percent = sum_percent + a.day_percent
      end
    end
    
    return sum_percent
  end

end
