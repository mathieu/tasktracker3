class AddDayPercentToActivity < ActiveRecord::Migration
  def self.up
    add_column :activities, :day_percent, :integer
  end

  def self.down
    remove_column :activities, :day_percent
  end
end
