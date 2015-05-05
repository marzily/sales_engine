require_relative 'test_helper'

class Repository

  def model_class
    ModelObject
  end

end


class RepositoryTest < Minitest::Test
  attr_reader :repo

  def setup
    data = [{ id: "15",
              created_at: "2012-05-27 14:54:09 UTC",
              updated_at: "2012-06-27 14:54:09 UTC"},
            { id: "34",
              created_at: "2015-08-27 14:54:09 UTC",
              updated_at: "2015-10-27 14:54:09 UTC"},
            { id: "7",
              created_at: "2012-05-27 14:54:09 UTC",
              updated_at: "2014-06-27 14:54:09 UTC"}]
    @repo = Repository.new(data, nil)
  end

  def test_it_returns_entire_collection
    assert_equal 3, repo.all.count
    assert_equal 15, repo.all.first.id
    assert_equal 7, repo.all.last.id
  end

  def test_it_returns_a_random_model_object
    sample = 10.times.map { |i| repo.random.id }
    refute sample.all? { |id| id == sample.first }
  end

  def test_it_finds_a_model_object_by_id
    assert_equal 34, repo.find_by_id(34).id
  end

  def find_all_by_id
    assert_equal 1, repo.find_all_by_id(7).count
  end

  def test_it_finds_a_model_object_by_created_at_time_stamp
    assert_equal 15, repo.find_by_created_at("2012-05-27 14:54:09 UTC").id
  end

  def test_it_finds_a_model_object_by_updated_at_time_stamp
    assert_equal 34, repo.find_by_updated_at("2015-10-27 14:54:09 UTC").id
  end

  def test_it_finds_all_by_created_at_time_stamp
    assert_equal 2, repo.find_all_by_created_at("2012-05-27 14:54:09 UTC").count
  end

  def test_it_finds_all_by_updated_at_time_stamp
    assert_equal 1, repo.find_all_by_updated_at("2014-06-27 14:54:09 UTC").count
  end

end
