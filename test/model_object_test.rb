require './test/test_helper'

class ModelObjectTest < Minitest::Test

  def setup
    data = {  id: "15",
              created_at: "2012-05-27 14:54:09 UTC",
              updated_at: "2012-06-27 14:54:09 UTC"
            }
    @model_object = ModelObject.new(data, nil)
  end

  def test_customer_has_an_id
    assert_equal 15, @model_object.id
  end

  def test_it_has_created_at_time_stamp
    assert_equal "2012-05-27 14:54:09 UTC", @model_object.created_at
  end

  def test_it_has_updated_at_time_stamp
    assert_equal "2012-06-27 14:54:09 UTC", @model_object.updated_at
  end

  def test_updated_at_time_stamp_can_be_changed
    @model_object.updated_at = "2015-04-30 14:54:09 UTC"
    refute_equal "2012-06-27 14:54:09 UTC", @model_object.updated_at
  end

end
