require 'minitest/autorun'
require 'minitest/pride'
require './lib/invoice'

class InvoiceTest < Minitest::Test
  attr_reader :invoice

  def setup
    data = {  id:          "3",
              customer_id: "1",
              merchant_id: "78",
              status:      "shipped"
            }
    @invoice = Invoice.new(data, nil)
  end

  def test_invoice_has_id
    assert_equal 3, invoice.id
  end

  def test_invoice_has_customer_id
    assert_equal 1, invoice.customer_id
  end

  def test_invoice_has_merchant_id
    assert_equal 78, invoice.merchant_id
  end

  def test_invoice_has_status
    assert_equal "shipped", invoice.status
  end
  
end
