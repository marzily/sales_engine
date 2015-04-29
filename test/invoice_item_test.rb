require './test/test_helper'

class InvoiceItemTest < Minitest::Test

  def setup
    data = {  id: "1",
              item_id: "539",
              invoice_id: "1",
              quantity: "5",
              unit_price: "13635",
              created_at: "2012-03-27 14:54:09 UTC",
              updated_at: "2012-03-27 14:54:09 UTC"
            }

    @invoice_item = InvoiceItem.new(data, nil)
  end

  def test_customer_has_an_id
    assert_equal 1, @invoice_item.id
  end

  def test_customer_has_a_first_name
    assert_equal 539, @invoice_item.item_id
  end

  def test_customer_has_a_last_name
    assert_equal 1, @invoice_item.invoice_id
  end

end
