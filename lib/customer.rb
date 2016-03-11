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