class Greeter

	attr_accessor :name

	def initialize(name = "shiteinasi")
		@name = name
	end
	
	def say_Hi
		puts "Hi #{@name}"
	end

	def say_bye
		puts "Bye #{@name}"
	end
end

greeter = Greeter.new("Bekky")

greeter.say_Hi

greeter.say_bye

greeter.respond_to?("name")
greeter.respond_to?("name=")

greeter.name= "Karry"

greeter.say_Hi
greeter.say_bye


