class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.date :date
      t.string :description
      t.references :project

      t.timestamps
    end
  end

  def self.down
    drop_table :activities
  end
end
