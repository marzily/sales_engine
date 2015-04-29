require 'minitest/autorun'
require 'minitest/pride'
require './lib/invoice_repository'
require './lib/parser'
require './lib/sales_engine'

class InvoiceRepositoryTest < Minitest::Test
  include Parser

  attr_reader :fixtures

  def setup
    @fixtures = parse('./test/fixtures/invoices.csv')
  end

  def test_invoice_repository_exists
    assert InvoiceRepository.new(fixtures, nil)
  end

  def test_it_knows_sales_engine
    engine       = SalesEngine.new("stub")
    invoice_repo = InvoiceRepository.new(fixtures, engine)

    assert_equal engine, invoice_repo.engine
  end

  def test_it_finds_all_invoices
    invoice_repo = InvoiceRepository.new(fixtures, nil)

    assert_equal 10, invoice_repo.all.count
  end

  def test_it_returns_random_invoice
    invoice_repo = InvoiceRepository.new(fixtures, nil)

    assert invoice_repo.random
  end

  def test_it_can_find_by_id
    invoice_repo = InvoiceRepository.new(fixtures, nil)
    result       = invoice_repo.find_by_id(1)

    assert_equal 1, result.id
  end
end
