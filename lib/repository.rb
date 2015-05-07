require 'date'
require_relative 'model_object'

class Repository

  attr_reader :collection, :engine

  def initialize(data, engine)
    @collection = generate(data)
    @engine     = engine
  end

  def generate(data)
    data.map { |object_data| model_class.new(object_data, self) }
  end

  def all
    collection
  end

  def random
    collection.sample
  end

  def find_by_id(id)
    find_all_by_id(id).first
  end

  def find_all_by_id(id)
    collection.select { |object| object.id == id }
  end

  def find_by_created_at(time_stamp)
    find_all_by_created_at(time_stamp).first
  end

  def find_all_by_created_at(time_stamp)
    date = Date.parse(time_stamp) unless time_stamp.is_a?(Date)
    collection.select { |object| object.created_at == date }
  end

  def find_by_updated_at(time_stamp)
    find_all_by_updated_at(time_stamp).first
  end

  def find_all_by_updated_at(time_stamp)
    date = Date.parse(time_stamp) unless time_stamp.is_a?(Date)
    collection.select { |object| object.updated_at == date }
  end

  def inspect
    "#<#{self.class} #{collection.size} rows>"
  end

end
