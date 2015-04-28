require "csv"
puts "CSV Parser initialized."

contents = CSV.open "./data/customers.csv", headers: true, header_converters: :symbol
contents.each do |row|
  name = row[:first_name]
end



# id,first_name,last_name,created_at,updated_at
