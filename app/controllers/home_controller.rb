class HomeController < ApplicationController
	def show
		@foods = Food.all
    	@locations = Location.all
	end
end
