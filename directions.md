Due 3pm on Tuesday, May 12th (2 weeks)

http://tutorials.jumpstartlab.com/projects/sales_engine.html
http://today.turing.io/outlines/2015-04-27/

Ruby on Rails uses ActiveRecord to talk to the database.
Sales Engine is a clone of ActiveRecord
Stores data in CSV files v database

Use CSV parser for data
money is represented as cents

#Customers
*****build in option to take argument from command line
engine = SalesEngine.new(csv = file_path)
engine.startup --->will load up data from filesystem b/c SalesEngine.new will create too many instances


repo = engine.customer_repository
repo.class == CustomerRepository
customer = repo.find_by_first_name("Mariah")
customer.class == Customer
customer.name == "Mariah"
customer.id == 3

X is a placeholder for data
repo.find_by_X(first_name/id/etc.)
customer = find_by_id(3)
customer.name == "Mariah"

----Find by all headers

#Invoices

repo = engine.invoice_repository
repo.class == InvoiceRepository

invoice = repo.find_by_id(10)
invoice.class == Invoice
invoice.merchant_id == 86
invoice.customer_id == 3

customer = invoice.customer
customer.class == Customer


customer.invoices.class == Array (or Invoice Repository)
customer.invoices.first == Invoice

Parse CSV in engine and pass to repo. Repo needs to be able to take customers independently of CSV.
