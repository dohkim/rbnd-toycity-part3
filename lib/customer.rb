class Customer
	attr_reader :name

	@@customers=[]

	def initialize(options={})
		@name = options[:name]
		add_to_customers
	end

	def add_to_customers
		if self.class.find_by_name(@name)
			raise DuplicateCustomerError, "#{@name} already exists."
		else
			@@customers << self
		end		
	end

	def purchase(product)
		Transaction.new(self, product)		
	end

	def return_item(transaction)
		transaction.cancel(self)		
	end

	#display all purchases.
	def purchases
		purchases = Transaction.find_by_customer(self)
		puts "#{self.name}'s purchases"
		puts "Transaction ID\t Product"
		purchases.each do |purchase| 
			print "#{purchase.id}\t\t #{purchase.product.title} "
			if purchase.return_item
				puts "(Return Item)"
			else
				puts ""
			end
		end
	end



	

	def self.all
		@@customers
	end

	def self.find_by_name(name)
		@@customers.each do |customer|			
			if customer.name == name
				return customer
			end
		end	
		return false		
	end

end