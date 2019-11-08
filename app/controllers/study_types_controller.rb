class StudyTypesController < ApplicationController
	before_action :doorkeeper_authorize!

	def index
		render_collection StudyType.all.order(name: :asc)
	end
end