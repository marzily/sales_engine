require_relative 'test_helper'

class InvoiceTest < Minitest::Test
  attr_reader :invoice, :invoice1

  def setup
    data = {  id:          "3",
              customer_id: "1",
              merchant_id: "78",
              status:      "shipped",
              created_at: "2012-03-27 14:54:09 UTC",
              updated_at: "2012-03-27 14:54:09 UTC"
            }
    @invoice = Invoice.new(data, nil)

    engine = SalesEngine.new('./test/fixtures/')
    engine.startup
    @invoice1 = engine.invoice_repository.collection[1]
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

  def test_it_returns_all_transactions_for_invoice
    assert_equal 1, invoice1.transactions.count
  end

  def test_it_returns_all_invoice_items_for_invoice
    assert_equal 2, invoice1.invoice_items.count
  end

  def test_it_finds_all_items_by_way_of_invoice_items
    assert_equal 0, invoice1.items.count
  end

  def test_it_finds_customer_associated_with_this_invoice
    assert_equal 1, invoice1.customer.id
    assert_equal "Joey", invoice1.customer.first_name
  end

  def test_it_finds_merchant_associated_with_this_invoice
    assert_nil invoice1.merchant
  end

  def test_charge_creates_a_new_transaction
    data = { credit_card_number: "4444333322221111",
      credit_card_expiration: "10/13", result: "success" }
      transaction = invoice1.charge(data)

    assert_instance_of Transaction, transaction
    assert_equal 11, transaction.id
  end

end
