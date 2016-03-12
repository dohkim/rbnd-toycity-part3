class Transaction
	attr_reader :product, :customer, :id
	@@count=0
	@@transactions=[]
	def initialize(customer, product, options={})
		@product = product
		@customer = customer
		add_to_transaction		
	end

	def cancel(customer)
		check_customer(customer)	#check if it is same customer between transaction and customer
		@product.in 				#add item from returning
		delete_transaction		    #transaction delete
	end


	def add_to_transaction
		@@count +=1
		@id = @@count
		@@transactions << self
	end
	

	def self.all
		@@transactions
	end

	def check_customer(customer)		
		#Customer only able to delete their transaction.
		if customer != self.customer
			raise NotauthorizeError, "#{self.customer.name} is not able to return item of #{customer.name}'s"
		end
	end


	def self.find(index)		
		@@transactions.each do |transaction| 
			if transaction.id == index
				return transaction
			end
		end
		return false
	end

	def self.find_by_customer(customer)
		@@transactions.select {|transaction| transaction.customer == customer}
	end

	private	
	def delete_transaction
		@@transactions.delete(self)
	end

end