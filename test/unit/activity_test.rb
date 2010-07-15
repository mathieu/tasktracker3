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
  
end
