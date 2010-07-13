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
    activity = Activity.create
    activity.description = "wip"
    activity.date = Date.parse('2010-07-11')
    activity.user = users(:mat)
    activity.project = projects(:p1)
    assert !activity.valid?, "activity shouldn't be valid"
    assert activity.errors[:date].any? , "activity.errors[:date].any? should be true"
  end

end
