require_relative 'test_helper'

class ItemTest < Minitest::Test
  attr_reader :item, :item_from_repo

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

    engine = SalesEngine.new('./test/fixtures/')
    engine.startup
    @item_from_repo = engine.item_repository.collection.first
  end

  def test_item_has_a_default_id
    assert_equal 1, item.id
  end

  def test_item_has_a_name
    assert_equal "Test Item", item.name
  end

  def test_item_has_description
    assert_equal "this is the ideal item", item.description
  end

  def test_item_has_unit_price
    assert_equal BigDecimal.new(75107) / 100, item.unit_price
  end

  def test_item_has_merchant_id
    assert_equal 3, item.merchant_id
  end

  def test_invoice_items_returns_all_invoice_items_for_item
    assert_equal 0, item_from_repo.invoice_items.count
  end

  def test_merchant_returns_a_merchant_for_item
    assert_equal 1, item_from_repo.merchant.id
  end

  def test_it_finds_the_best_day_for_sales
    assert_nil item_from_repo.best_day
  end
end
