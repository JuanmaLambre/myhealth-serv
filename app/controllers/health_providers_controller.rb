class HealthProvidersController < ApplicationController
	before_action :doorkeeper_authorize!

	def search
		# health_providers = HealthProvider.where(specialty: params[:specialty])
		# 	.within(params[:radius], :origin => [params[:latitude], params[:longitude]])
		health_providers = []
		render_collection health_providers
	end
end
