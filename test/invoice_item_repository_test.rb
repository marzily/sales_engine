require_relative 'test_helper'

class InvoiceItemRepositoryTest < Minitest::Test
  attr_reader :repo

  def setup
    customer_data = Parser.new("./test/fixtures/invoice_items.csv").values
    @repo = InvoiceItemRepository.new(customer_data, nil)
  end

  def test_it_finds_all_invoice_items_by_item_id
    assert_equal 1, @repo.find_all_by_item_id(535).count
  end

  def test_it_finds_first_invoice_item_by_item_id
    assert_equal 4, @repo.find_by_item_id(535).id
  end

  def test_it_finds_all_invoice_items_by_invoice_id
    assert_equal 8, @repo.find_all_by_invoice_id(1).count
  end

  def test_it_finds_first_invoice_item_by_invoice_id
    assert_equal 1, @repo.find_by_invoice_id(1).id
  end

  def test_it_finds_all_invoice_items_by_quantity
    assert_equal 2, @repo.find_all_by_quantity(6).count
  end

  def test_it_finds_first_invoice_item_by_quantity
    assert_equal 8, @repo.find_by_quantity(6).id
  end

  def test_it_finds_all_invoice_items_by_unit_price
    assert_equal 1, @repo.find_all_by_unit_price(52100).count
  end

  def test_it_finds_first_invoice_item_by_unit_price
    assert_equal 6, @repo.find_by_unit_price(52100).id
  end
end
