class InstanceObject

  attr_reader :id, :created_at
  attr_accessor :updated_at

  def initialize(data)
    @id         = data[:id].to_i
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
  end

  def test_method(arg)
    arg + 1
  end

end
