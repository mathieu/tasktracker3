class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.date :day
      t.references :project
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :activities
  end
end
