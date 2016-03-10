class Product
	attr_reader :title, :price, :stock

	@@products = []

	def initialize(options={})
		@title = options[:title]		
		@price = options[:price]	
		@stock = options[:stock]	
		add_to_products
	end
	def add_to_products
		if self.class.find_by_title(@title)
			raise DuplicateProductError, "#{@title} is already exists"
		else
			@@products << self			
		end		
	end

	def in_stock?
		@stock != 0
	end

	


	def self.all
		@@products
	end

	def self.find_by_title(title)
		@@products.each do |product|			
			if product.title == title
				return product
			end
		end	
		return false		
	end

	def self.in_stock		
		stock = @@products.select {|product| product.stock > 0}		
	end

end