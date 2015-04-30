require './test/test_helper'
require 'csv'

class InvoiceRepositoryTest < Minitest::Test
  include Parser

  attr_reader :repo

  def setup
    data  = parse("./test/fixtures/invoices.csv")
    @repo = InvoiceRepository.new(data, nil)
  end

  def test_it_can_find_by_customer_id
    invoice_object = repo.find_by_customer_id(2)

    assert_equal 9, invoice_object.id 
  end  

  def test_it_can_find_by_merchant_id
    invoice_object = repo.find_by_merchant_id(75)

    assert_equal 2, invoice_object.id 
  end
end
