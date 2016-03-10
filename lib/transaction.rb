class Transaction
	attr_reader :product, :customer, :id
	@@id=0
	def initialize(customer, product)
		@product = product
		@customer = customer
		assign_id
	end

	def assign_id
		@@id +=1
		@id = @@id
	end
end