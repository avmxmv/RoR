module Admin
	class Compani_name
		attr_accessor :name

		def initialize(name)
			@name = name
		end
	end
end

module All_st
	def all_st
    	puts @first
    	puts @middle_stations
    	puts @last
  	end
end