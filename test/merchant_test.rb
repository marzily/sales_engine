require_relative 'test_helper'

class MerchantTest < Minitest::Test
  attr_reader :merchant, :merchant_from_repo

  def setup
    data = {  id:         "1",
              name:       "Cummings-Thiel",
              created_at: "2012-03-27 14:54:00 UTC",
              updated_at: "2012-03-27 14:54:00 UTC"
            }
    @merchant = Merchant.new(data, nil)

    engine = SalesEngine.new('./test/fixtures/')
    engine.startup
    @merchant_from_repo = engine.merchant_repository.collection.first
  end

  def test_merchant_has_a_default_id
    assert_equal 1, merchant.id
  end

  def test_merchant_has_a_name
    assert_equal "Cummings-Thiel", merchant.name
  end

  def test_items_returns_all_items_for_merchant
    assert_equal 10, merchant_from_repo.items.count
  end

  def test_items_returns_all_invoices_for_merchant
    assert_equal 0, merchant_from_repo.invoices.count
  end

  def test_revenue_returns_total_revenue_for_merchant_for_all_transactions
    assert_equal 0, merchant_from_repo.revenue
  end

  def test_it_finds_a_merchants_favorite_customer
    assert_nil merchant_from_repo.favorite_customer
  end

  def test_it_returns_customers_with_pending_invoices
    assert_equal 0, merchant_from_repo.customers_with_pending_invoices.count
  end
end
