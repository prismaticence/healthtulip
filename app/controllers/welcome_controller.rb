class WelcomeController < ApplicationController
	def index
		@treatments = Treatment.all
	end
end