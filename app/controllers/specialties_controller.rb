class SpecialtiesController < ApplicationController
	before_action :doorkeeper_authorize!

	def index
		render_collection Specialty.all
	end
end
