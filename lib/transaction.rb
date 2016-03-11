class Transaction
	attr_reader :product, :customer, :id
	@@count=0
	@@transactions=[]
	def initialize(customer, product)
		@product = product
		@customer = customer
		add_to_transaction
		product.purchased			
	end

	def add_to_transaction
		@@count +=1
		@id = @@count
		@@transactions << self
	end

	def self.all
		@@transactions
	end

	def self.find(index)		
		@@transactions.each do |transaction| 
			if transaction.id == index
				return transaction
			end
		end
		return false
	end
end