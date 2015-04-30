require './test/test_helper'

class ItemTest < Minitest::Test
  attr_reader :item

  def setup
    data = {  id:          "1",
              name:        "Test Item",
              created_at:  "2012-03-27 14:54:00 UTC",
              updated_at:  "2012-03-27 14:54:00 UTC",
              description: "this is the ideal item",
              unit_price:  "75107",
              merchant_id: "3"
            }
    @item = Item.new(data, nil)
  end

  def test_item_has_a_default_id
    assert_equal 1, item.id
  end

  def test_item_has_a_name
    assert_equal "Test Item", item.name
  end

  def test_item_has_created_at_date_in_yyyymmdd_hhmmss_format
    assert_equal "2012-03-27 14:54:00 UTC", item.created_at
  end

  def test_item_has_updated_date_in_yyymmdd__hhmmss_format
    assert_equal "2012-03-27 14:54:00 UTC", item.updated_at
  end

  def test_item_has_description
    assert_equal "this is the ideal item", item.description
  end

  def test_item_has_unit_price
    assert_equal 75107, item.unit_price
  end

  def test_item_has_merchant_id
    assert_equal 3, item.merchant_id
  end
end