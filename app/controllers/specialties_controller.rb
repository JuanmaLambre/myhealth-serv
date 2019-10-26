class SpecialtiesController < ApplicationController
	before_action :doorkeeper_authorize!

	def show
		render_collection Specialty.all
	end
end
