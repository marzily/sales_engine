require_relative 'test_helper'

class MerchantTest < Minitest::Test
  attr_reader :merchant

  def setup
    data = {  id:         "1",
              name:       "Cummings-Thiel",
              created_at: "2012-03-27 14:54:00 UTC",
              updated_at: "2012-03-27 14:54:00 UTC"
            }
    @merchant = Merchant.new(data, nil)
  end

  def test_merchant_has_a_default_id
    assert_equal 1, merchant.id
  end

  def test_merchant_has_a_name
    assert_equal "Cummings-Thiel", merchant.name
  end

  def test_items_returns_all_items_for_merchant
    engine = SalesEngine.new('./test/fixtures/')
    engine.startup
    merchant = engine.merchant_repository.collection.first

    assert_equal 10, merchant.items.count
  end

  def test_items_returns_all_invoices_for_merchant
    engine = SalesEngine.new('./test/fixtures/')
    engine.startup
    merchant = engine.merchant_repository.collection.first

    assert_equal 0, merchant.invoices.count
  end

  def test_revenue_returns_total_revenue_for_merchant_for_all_transactions
    engine = SalesEngine.new('./test/fixtures/')
    engine.startup
    merchant = engine.merchant_repository.collection.first

    # assert_equal  __ , merchant.revenue
  end
end
