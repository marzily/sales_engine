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

  def hash_repo(index_key)
    index_keys = index_key.split(".")

    Hash.new([]).merge(all.group_by do |se_object|
      index_keys.inject(se_object) { |object, key| object.method(key).call }
    end)
  end

  def find_all_by_id(id)
    @all_by_id ||= hash_repo("id")
    @all_by_id[id]
  end

  def find_by_id(id)
    find_all_by_id(id).first
  end

  def find_all_by_created_at(time_stamp)
    @all_by_created_at ||= hash_repo("created_at")
    @all_by_created_at[time_stamp]
  end

  def find_by_created_at(time_stamp)
    find_all_by_created_at(time_stamp).first
  end

  def find_all_by_updated_at(time_stamp)
    @all_by_updated_at ||= hash_repo("updated_at")
    @all_by_updated_at[time_stamp]
  end

  def find_by_updated_at(time_stamp)
    find_all_by_updated_at(time_stamp).first
  end

  def inspect
    "#<#{self.class} #{collection.size} rows>"
  end
end
