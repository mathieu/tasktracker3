require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  test "test invalid empty Activity" do
    activity = Activity.new
    assert !activity.valid?
    assert activity.user.nil?
    assert activity.project.nil?
    assert activity.errors[:description].any?
    assert activity.errors[:user].any?
    assert activity.errors[:project].any?
  end

  test "test invalid existing date" do
    activity = Activity.create(:date => Date.parse('2010-07-11'), :user => User.all[0], :project => Project.all[0])
    assert activity.errors[:one_date_for_user].any? , "activity.errors[:one_date_for_user].any? should be true"
  end
end
