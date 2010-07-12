require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  test "test invalid empty Activity" do
    activity = Activity.new
    assert !activity.valid?
    assert !activity.user.valid?
    assert !activity.project.valid?
  end

  test "one activity per date for one user" do
    activity = Activity.create(:date => '20100711', :user => User.all[0], :project => Project.all[0])
    assert !activity.valid?
  end
end
