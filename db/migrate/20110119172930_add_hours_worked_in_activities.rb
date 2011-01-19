
//
class AddHoursWorkedInActivities < ActiveRecord::Migration
  def self.up
    add_column :activities, :hours_worked, :integer
  end

  def self.down
    remove_column :activities, :hours_worked
  end
end
