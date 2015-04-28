require 'minitest/autorun'
require 'minitest/pride'
require './lib/invoice'

class InvoiceTest < Minitest::Test
  def setup
    @data = { id:          "3",
              customer_id: "1",
              merchant_id: "78"} 
  end

  def test_invoice_has_id
    invoice = Invoice.new(@data)

    assert_equal 3, invoice.id
  end

  def test_invoice_has_customer_id
    invoice = Invoice.new(@data)

    assert_equal 1, invoice.customer_id
  end

  def test_invoice_has_merchant_id
    invoice = Invoice.new(@data)

    assert_equal 78, invoice.merchant_id
  end
end
