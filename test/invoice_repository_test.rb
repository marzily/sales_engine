require_relative 'test_helper'

class InvoiceRepositoryTest < Minitest::Test
  attr_reader :repo, :engine, :repo_from_engine

  def setup
    data  = Parser.new("./test/fixtures/invoices.csv").values
    @repo = InvoiceRepository.new(data, nil)

    @engine = SalesEngine.new('./test/fixtures/')
    engine.startup
    @repo_from_engine = engine.invoice_repository
  end

  def test_it_can_find_by_customer_id
    invoice_object = repo.find_by_customer_id(2)

    assert_equal 9, invoice_object.id
  end

  def test_it_can_find_by_merchant_id
    invoice_object = repo.find_by_merchant_id(75)

    assert_equal 2, invoice_object.id
  end

  def test_it_can_find_all_by_customer_id
    assert_equal 8, repo.find_all_by_customer_id(1).count
  end

  def test_it_can_find_all_by_merchant_id
    assert_equal 1, repo.find_all_by_merchant_id(86).count
  end

  def test_it_can_find_by_status
    assert_equal 1, repo.find_by_status('shipped').id
  end

  def test_it_can_find_all_by_status
    assert_equal 10, repo.find_all_by_status('shipped').count
  end
end
