require 'test_helper'

class UserTaskTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert UserTask.new.valid?
  end
end
