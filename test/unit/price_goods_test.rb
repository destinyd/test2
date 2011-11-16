require 'test_helper'

class PriceGoodsTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert PriceGoods.new.valid?
  end
end
