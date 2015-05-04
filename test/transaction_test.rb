require_relative 'test_helper'

class TransactionTest < Minitest::Test
  attr_reader :transaction

  def setup
    data = {  id:                 "1",
              invoice_id:         "1",
              credit_card_number: "4654405418249632",
              cc_expiration_date: "2019-05",
              result:             "success",
              created_at:         "2012-03-27 14:54:09 UTC",
              updated_at:         "2012-03-27 14:54:09 UTC"
            }
    @transaction = Transaction.new(data, nil)
  end

  def test_transaction_has_a_id
    assert_equal 1, transaction.id
  end

  def test_transaction_has_invoice_id
    assert_equal 1, transaction.invoice_id
  end

  def test_transaction_has_credit_card_number
    assert_equal "4654405418249632", transaction.credit_card_number
  end

  def test_transaction_has_credit_card_expiration_date
    assert_equal "2019-05", transaction.cc_expiration_date
  end

  def test_transactio_has_result
    assert_equal "success", transaction.result
  end

  def test_transaction_has_created_at_date_in_yyyymmdd_hhmmss_format
    assert_equal "2012-03-27 14:54:09 UTC", transaction.created_at
  end

  def test_transaction_has_updated_date_in_yyymmdd__hhmmss_format
    assert_equal "2012-03-27 14:54:09 UTC", transaction.updated_at
  end

  def test_invoice_returns_a_invoice_for_transaction
    engine = SalesEngine.new('./test/fixtures/')
    engine.startup
    transaction = engine.transaction_repository.collection.first

    assert_equal 1, transaction.invoice.id
  end
 end
