#!/usr/bin/env ruby

class MegaGreeter 

	attr_accessor :names

	# create object
	def initialize(names = "World")
		@names = names
	end

	#Say Hi to everybody
	def say_hi
		if @names.nil?
			puts "..."
		elsif @names.respond_to?("each")
			# iterate
			@names.each do |name|
				puts "Hello #{name}!"
			end
		else
			puts "Hello #{@names}!"
		end
	end

	# Say by to everybody
	def say_bye
		if @names.nil?
			puts "..."
		elsif @names.respond_to?("join")
			# join
			puts "GoodBye #{@names.join(", ")}. Come Back Soon!!"
		else
			puts "GoodBye #{@names} . Come Back Soon."
		end
	end	
end


if __FILE__ == $0
	mg = MegaGreeter.new
	mg.say_hi
	mg.say_bye

	# Change name To Zeke
	mg.names = "Zeke"
	mg.say_hi
	mg.say_bye

	# Change the name to an array of names
	mg.names = ["testa", "testb", "testc", "testd", "teste"]
	mg.say_hi
	mg.say_bye

	# Change to nil
	mg.names = nil
	mg.say_hi
	mg.say_bye
end
