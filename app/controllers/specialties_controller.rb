class SpecialtiesController < ApplicationController

	def show
		render_collection Specialty.all
	end

end
