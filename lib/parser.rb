require 'csv'

module Parser

  def parse(file_path)
    CSV.open(file_path), headers: true, header_converters: :symbol
  end
end

