require './test/test_helper'

class InvoiceItemTest < Minitest::Test

  def setup
    data = {  id: "14",
              item_id: "539",
              invoice_id: "1",
              quantity: "5",
              unit_price: "13635",
              created_at: "2012-03-27 14:54:09 UTC",
              updated_at: "2012-03-27 14:54:09 UTC"
            }
    @invoice_item = InvoiceItem.new(data, nil)
  end

  def test_it_initializes_with_instance_object_attributes
    assert_equal 14, @invoice_item.id
    assert_equal "2012-03-27 14:54:09 UTC", @invoice_item.created_at
    assert_equal "2012-03-27 14:54:09 UTC", @invoice_item.updated_at
    assert_nil @invoice_item.repository
  end

  def test_it_has_an_item_id
    assert_equal 539, @invoice_item.item_id
  end

  def test_it_has_an_invoice_id
    assert_equal 1, @invoice_item.invoice_id
  end

  def test_it_has_a_quantity
    assert_equal 5, @invoice_item.quantity
  end

  def test_it_has_a_unit_price
    assert_equal 13635, @invoice_item.unit_price
  end

  def test_invoice_returns_an_instance_of_invoice_item
    engine = SalesEngine.new('./test/fixtures/')
    engine.startup
    invoice_item = engine.invoice_item_repository.collection.first
    
    assert_equal 1, invoice_item.invoice.id
  end  

  def test_item_returns_an_instance_of_invoice_item
    engine = SalesEngine.new('./test/fixtures/')
    engine.startup
    invoice_item = engine.invoice_item_repository.collection.first

    assert_equal 1, invoice_item.item.id
  end

end
