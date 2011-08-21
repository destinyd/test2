require 'test_helper'

class FocusTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Focus.new.valid?
  end
end
