require_relative 'test_helper'

class TransactionRepositoryTest < Minitest::Test
  attr_reader :repo

  def setup
    transaction_data = Parser.new("./test/fixtures/transactions.csv").values
    @repo = TransactionRepository.new(transaction_data, nil)
  end

  def test_it_finds_first_transaction_by_invoice_id
    assert_nil repo.find_by_invoice_id(3)
    assert_equal 3, repo.find_by_invoice_id(4).id
  end

  def test_it_finds_all_transactions_by_invoice_id
    assert_equal 1, repo.find_all_by_invoice_id(4).count
  end

  def test_it_finds_first_transaction_by_credit_card_number
    assert_equal 2, repo.find_by_credit_card_number(4580251236515201).id
  end

  def test_it_finds_all_transactions_by_credit_card_number
    assert_equal 1, repo.find_all_by_credit_card_number(4580251236515201).count
  end

  def test_it_finds_first_transaction_by_cc_expiration_date
    assert_nil repo.find_by_cc_expiration_date("2015-05")
    assert_equal 1, repo.find_by_cc_expiration_date(nil).id
  end

  def test_it_finds_all_transactions_by_cc_expiration_date
    assert_equal 10, repo.find_all_by_cc_expiration_date(nil).count
  end

  def test_it_finds_first_transaction_by_result
    assert_equal 1, repo.find_by_result("success").id
  end

  def test_it_finds_all_transactions_by_result
    assert_equal 10, repo.find_all_by_result("success").count
  end
end
