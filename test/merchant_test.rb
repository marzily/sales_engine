require 'minitest/autorun'
require 'minitest/pride'
require './lib/merchant'

class MerchantTest < Minitest::Test
  def setup
    @data = { id:         1,
              name:       "Cummings-Thiel",
              created_at: "2012-03-27 14:54:00 UTC",
              updated_at: "2012-03-27 14:54:00 UTC" }
  end

  def test_merchant_has_a_default_id
    merchant = Merchant.new(@data, nil)

    assert_equal 1, merchant.id
  end

  def test_merchant_has_a_name
    merchant = Merchant.new(@data, nil)
    assert_equal "Cummings-Thiel", merchant.name
  end

  def test_merchant_has_created_at_date_in_yyyymmdd_hhmmss_format
    merchant = Merchant.new(@data, nil)

    assert_equal "2012-03-27 14:54:00 UTC", merchant.created_at
  end
end